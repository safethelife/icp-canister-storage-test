import Http "mo:base/Http";
import Blob "mo:base/Blob";
import Principal "mo:base/Principal";

actor {
    type UserId = Text;
    type FileContent = Blob;
    type Storage = {#file: FileContent; #userId: UserId};

    private var storage: [Storage] = [];

    public shared func http_request(request: Http.Request): async Http.Response {
        // 요청 URL 경로 확인
        if (request.method == "POST" and request.url == "/image") {
            // 사용자 ID 추출
            let userId = request.headers.find(func ((key, _)) : Bool { key.toLowerCase() == "user-id" }).map<UserId>(func (_, value) { value }).get("");
            let fileContent = request.body;

            // 저장소에 사용자 ID와 파일 저장
            storage := storage + [{#file: fileContent; #userId: userId}];

            // 성공 응답 반환
            return {
                body = Blob.fromText("Image uploaded successfully."),
                headers = [("Content-Type", "text/plain")],
                status_code = 200,
            };
        } else {
            // /image 엔드포인트 외의 다른 경로 또는 다른 HTTP 메소드에 대한 요청 처리
            return {
                body = Blob.fromText("Not Found or Method Not Allowed"),
                headers = [("Content-Type", "text/plain")],
                status_code = match (request.method == "POST") { true => 404; false => 405; },
            };
        }
    }
};

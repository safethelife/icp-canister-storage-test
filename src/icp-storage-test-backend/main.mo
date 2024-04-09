import Principal "mo:base/Principal";
actor {
  public query func postTest() : async Principal{
    return Principal.fromActor(this);
  }

  public shared func http_request(request : Http.Request) : async Http.Response {
        switch (request.method) {
            case "POST" {
                // POST 로직 구현
                return {
                    body = request.body,
                    headers = [("Content-Type", "text/plain")],
                    status_code = 200,
                };
            };
            case "GET" {
                
                return {
                    body = Blob.fromArray([]);
                    headers = [("Content-Type", "text/plain")],
                    status_code = 405,
                };
            };
        };
        return {
          body = request.body,
          headers = [{"Content-Type", "text/plain"}],
          status_code = 500,
        };
    }
};

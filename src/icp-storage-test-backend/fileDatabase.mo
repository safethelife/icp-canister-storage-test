import Array "mo:base/Array";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Text "mo:base/Text";
import Types "./types";

module {
  type FileId = Types.FileId;
  type File = Types.File;

  public class Directory() {
    let hashMap = HashMap.HashMap<FileId, File>(12, Text.equal, Text.hash);

    public func createOne(fileId: FileId, file: File) {
      hashMap.put(fileId, file);
    };

    public func updateOne(fileId: FileId, file: File) {
      hashMap.put(fileId, file);
    };

    public func findOne(fileId: FileId): ?File {
      hashMap.get(fileId);
    };

    public func findAll(): [File] {
      Iter.toArray<File>(hashMap.vals());
    };
  };
};
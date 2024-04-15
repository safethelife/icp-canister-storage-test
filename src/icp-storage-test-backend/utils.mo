import Array "mo:base/Array";
import Option "mo:base/Option";
import FileDatabase "./fileDatabase";
import UserDatabase "./userDatabase";
import Types "./types";

module {
  type File = Types.File;
  type FileId = Types.FileId;
  type User = Types.User;
  type UserId = Types.UserId;

  public func getFile(directory: FileDatabase.Directory, fileId: FileId): File {
    let existing = directory.findOne(fileId);
    switch (existing) {
      case (?existing) { existing };
      case (null) {
        {
          id = fileId;
          userId = "";
          bytes = "";
        }
      };
    };
  };

  public func getUser(directory: UserDatabase.Directory, userId: UserId): User {
    let existing = directory.findOne(userId);
    switch (existing) {
      case (?existing) { existing };
      case (null) {
        {
          id = userId;
        }
      };
    };
  };
};
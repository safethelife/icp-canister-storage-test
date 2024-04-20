import FileDatabase "./fileDatabase";
import UserDatabase "./userDatabase";
import Types "./types";
import Utils "./utils";

actor Main {
  var fileDirectory: FileDatabase.Directory = FileDatabase.Directory();
  var userDirectory: UserDatabase.Directory = UserDatabase.Directory();

  type File = Types.File;
  type FileId = Types.FileId;
  type User = Types.User;
  type UserId = Types.UserId;

  // Files

  public shared func createFile(fileId: FileId, file: File): async () {
    fileDirectory.createOne(fileId, file);
  };

  public shared func updateFile(file: File): async () {
    fileDirectory.updateOne(file.id, file);
  };

  public query func getFile(fileId: FileId): async File {
    Utils.getFile(fileDirectory, fileId)
  };

  public query func getAllFiles(): async [File] {
    fileDirectory.findAll()
  };

  // User

  public shared func createUser(userId: UserId, user: User): async () {
    userDirectory.createOne(userId, user);
  };

  public shared func updateUser(user: User): async () {
    userDirectory.updateOne(user.id, user);
  };

  public query func getUser(userId: UserId): async User {
    Utils.getUser(userDirectory, userId)
  };

  public query func getAllUsers(): async [User] {
    userDirectory.findAll()
  };
};
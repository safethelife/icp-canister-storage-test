import Principal "mo:base/Principal";

module {
  public type FileId = Text;

  public type File = {
    id: FileId;
    userId: UserId;
    bytes: Blob;
  };

  public type UserId = Text;

  public type User = {
    id: UserId;
  };
};
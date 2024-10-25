import Result "mo:base/Result";

module Types {
    public type User = {
        id: Principal;
        firstName: Text;
        lastName: Text;
    };

    public type GetUsersResult = Result.Result<[User], Text>;
};

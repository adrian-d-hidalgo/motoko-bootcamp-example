import Principal "mo:base/Principal";
import Debug "mo:base/Debug";
import Result "mo:base/Result";

actor {
    stable var name: Text = "";

    type User = (Text, Nat);

    var users: [User] = [
        ("Adrián", 36),
        ("Manuel", 45)
    ];

    public shared func setName(newName: Text): async () {
        name := newName;
    };

    public query func getName() : async Text {
        return name;
    };

    public shared query (msg) func whoAmI(): async Principal {
        return msg.caller;
    };

    type GetUsersResult = Result.Result<[User], Text>;

    public shared query ({caller}) func getUsers(): async GetUsersResult {
        Debug.print("Caller: " # Principal.toText(caller));

        if(Principal.isAnonymous(caller)) {
            Debug.print("Anonymous user");
            return #err("You must be authenticated to get users");
        };

        Debug.print("Authenticated user");

        return #ok(users);
    };
}

import Principal "mo:base/Principal";

actor {
    stable var name: Text = "";

    type User = (Text, Nat);

    var user: [User] = [
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

    public shared query ({caller}) func getUsers(): async [User] {
        if(Principal.isAnonymous(caller)) { return [];};

        return user;
    };
}

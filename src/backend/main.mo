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
}

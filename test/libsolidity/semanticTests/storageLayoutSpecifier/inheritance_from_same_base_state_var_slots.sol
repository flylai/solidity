contract A {
    uint x;
    function f() public view returns (uint xs) {
        assembly {
            xs := x.slot
        }
    }
}

contract B is A layout at 5 {
    uint y;
    function g() public view returns (uint xs, uint ys) {
        assembly {
            xs := x.slot
            ys := y.slot
        }
    }
}

contract C is A layout at 9 {
    uint z;
    function h() public view returns (uint xs, uint zs) {
        assembly {
            xs := x.slot
            zs := z.slot
        }
    }
}

contract Test {
    A a = new A();
    B b = new B();
    C c = new C();
    function callF() public view returns (uint) {
        return a.f();
    }
    function callG() public view returns (uint, uint) {
        return b.g();
    }
    function callH() public view returns (uint, uint) {
        return c.h();
    }
}
// ----
// callF() -> 0
// callG() -> 5, 6
// callH() -> 9, 10

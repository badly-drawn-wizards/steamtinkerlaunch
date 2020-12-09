{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      pkgs.callPackage ({
        stdenv, bc, bash, git, procps-ng, unzip, wget, which, xdotool, xorg, yad}:

      stdenv.mkDerivation {
        name = "steamtinkerlaunch";
        src = self;

        buildInputs = [
          bc
          bash
          git
          procps-ng
          unzip
          wget
          which
          xdotool
          xorg.xprop
          xorg.xrandr
          xorg.xwininfo
          yad
        ];

        installPhase = "PREFIX=$out make install";

      }) {};
  };
}

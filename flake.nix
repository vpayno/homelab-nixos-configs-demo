# flake.nix
{
  description = "My Homelab demo server configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    treefmt-conf = {
      url = "github:vpayno/nix-treefmt-conf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      treefmt-conf,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        version = "v0.1.0";

        pkgs = nixpkgs.legacyPackages.${system};

        commonDevShellPkgs = with pkgs; [
          bashInteractive
          coreutils
          git
          glow
          openssh
          moreutils
          nixos-anywhere
          nixos-rebuild
          npins
          runme
          tig
          tmux
        ];

        darwinOnlyBuildInputs =
          if pkgs.stdenv.isDarwin then
            with pkgs;
            [
              darwin.apple_sdk.frameworks.Security
            ]
          else
            [ ];
      in
      {
        formatter = treefmt-conf.formatter.${system};

        packages = {
        };

        apps = {
        };

        devShells = {
          default = pkgs.mkShell {
            packages = commonDevShellPkgs;

            buildInputs = darwinOnlyBuildInputs;

            GREETING = "Starting nix develop shell ${version}...";

            shellHook = ''
              ${pkgs.lib.getExe pkgs.cowsay} "$GREETING"
            '';
          };
        };
      }
    );
}

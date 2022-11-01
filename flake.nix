{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
  };
 

  outputs = { self, nixpkgs }: with nixpkgs.legacyPackages.x86_64-linux; {
    devShell.x86_64-linux = mkShell {
      buildInputs = [
        playwright
        playwright.browsers
      ];
      shellHook = ''
        export PLAYWRIGHT_BROWSERS_PATH=${playwright.browsers}
        export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true
        [ "$(nix --version)" == "nix (Nix) 2.11.0" ] || exit 1
        [ "$(direnv --version)" == "2.32.1" ] || exit 1
      '';
    };
  };
}

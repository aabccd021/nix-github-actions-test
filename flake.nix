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
        function assertEqual {
          if [[ "$1" != "$2" ]]; then
            echo -e "\033[0;31mInvalid version"
            echo -e "\033[0;31mActual: $1"
            echo -e "\033[0;31mExpected: $2"
            exit 1
          fi
        }
        assertEqual "$(nix --version)" "nix (Nix) 2.11.0" || exit 1
        assertEqual "$(direnv --version)" "2.2.1" || exit 1
      '';
    };
  };
}

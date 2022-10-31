{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
        echo ${playwright.browsers}
      '';
    };
  };
}

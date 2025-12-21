{
    description = "Local config";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nix-index-database.url = "github:nix-community/nix-index-database";
        nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
        nixgl = {
            url = "github:nix-community/nixGL";
        };
        stylix = {
            url = "github:nix-community/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        {
            nixgl,
            nixpkgs,
            home-manager,
            nix-index-database,
            stylix,
            ...
        }:
        let
            pkgs = import nixpkgs {
                system = "x86_64-linux";
                overlays = [ nixgl.overlay ];
                #      pkgs = nixpkgs.legacyPackages.${system};
            };
        in
        {
            homeConfigurations."leigh" = home-manager.lib.homeManagerConfiguration {
                #inherit pkgs;
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                modules = [
                    stylix.homeModules.stylix
                    ./home.nix
                    nix-index-database.homeModules.nix-index
                ];
            };
        };
}

{
  description = "mynixflake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
     
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest"; # always latest stable
    };

    nvf = {
      url = "github:notashelf/nvf";
    };

  };
  
  outputs = {self, nvf, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix

        nvf.nixosModules.default
        
        home-manager.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cedric = import ./home;
          home-manager.backupFileExtension = "backup";
        }

        inputs.stylix.nixosModules.stylix

        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}

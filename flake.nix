{
  description = "mynixflake";

  nixConfig = {
    extra-substituters = [ 
      "https://noctalia.cachix.org"
      "https://cache.nixos.org"
    ];
    extra-trusted-public-keys = [ 
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
 
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
     
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    myvim = {
      url = "github:cedric-star/MyVim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  
  outputs = {self, nvf, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";


      
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix

        myvim.nixosModules.default

        nvf.nixosModules.default
        
        home-manager.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cedric = import ./home;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
        }

        inputs.stylix.nixosModules.stylix

        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}

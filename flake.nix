{
  description = "Eh o configuras";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-22.11;
    home-manager = {
      url = github:nix-community/home-manager; # home-manager/release-22.05
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs,
    ...
  } @ inputs: {
    packages.x86_64-linux.zimbas = nixpkgs.legacyPackages.x86_64-linux.hello; # Hello world!
      
    nixosConfigurations = {
      pochita = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/pochita/configuration.nix ];
        specialArgs = { inherit inputs; };
      };      
    };
  };
}

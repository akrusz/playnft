{
  server = {pkgs, ...}:{
    networking.firewall.allowedTCPPorts = [ 22 80 5432 587 443 ];

    # security.acme.acceptTerms = true;
    # security.acme.email = "sfultong@gmail.com";

    services.nginx = {
      enable = true;

      # virtualHosts."playNFT.hhefesto.com" = {
      #   # enableACME = true;
      #   # forceSSL = true;
      #   locations = {
      #     "/" = {
      #       proxyPass = "http://localhost:3000";
      #     };
      #   };
      # };
    };

    environment.systemPackages = with pkgs; [
      git
      msmtp
      vim
      emacs
      zip
    ];

    nix.package = pkgs.nixFlakes;
    nix.extraOptions = "experimental-features = nix-command flakes";

    users.extraUsers.hhefesto = {
      createHome = true;
      isNormalUser = true;
      home = "/home/hhefesto";
      description = "Daniel Herrera";
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      hashedPassword = "$6$/RvS0Se.iCx$A0eA/8PzgMj.Ms9ohNamfu53c9S.zdG30hEmUHLjmWP0CaXTPVA6QxGIZ6fy.abkjSOTJMAq7fFL6LUBGs4BU0";
      # shell = pkgs.zsh; #"/run/current-system/sw/bin/bash";
    };

  };
}

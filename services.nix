{ config, pkgs, ... }:

let
  SOCAT = "${pkgs.socat}/bin/socat";
  PG_SOCKET = "/var/run/postgresql/.s.PGSQL.5432";
  SOCAT_TEMPLATE = FROM: TO: {
    Unit = {
      Description = "socat ${FROM} -> ${TO}";
    };
    Service = {
      ExecStart = "${SOCAT} -d -d -d -d ${FROM},fork,reuseaddr ${TO}";
      Type = "exec";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
in
{
  systemd.user.services = {
    socat_postgresql = SOCAT_TEMPLATE "TCP4-LISTEN:15432" "UNIX-CONNECT:${PG_SOCKET}";
  };
}

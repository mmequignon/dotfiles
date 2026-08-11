{ config, pkgs, ... }:
{
    programs.nixvim = {
        plugins.copilot-chat = {
            enable = true;
            settings = {
                highlight_headers = false;
                separator = "---";
                error_header = "> [!ERROR] Error";
            };
        };
        plugins.render-markdown = {
            enable = true;
            settings = {
                file_types = [
                    "markdown"
                    "copilot-chat"
                ];
            };
        };
    };
}

local common = require("markom-dot.common")
common.file_exec("<leader>x", "write | split | term node ")

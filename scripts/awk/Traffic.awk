# -*- tab-width: 4; -*-

BEGIN {
	split("KiB MiB GiB TiB", units, " ")

	for (i=1; i<=length(units); i++)
		bytes[i] = 1024^i
}

{
	n = split(FILENAME, file, "/")

	for (i=1; i<=length(bytes); i++) {
		if ($1/bytes[i] <= 999 && $1/bytes[i] >= 1) {
			unit=i
			break
		}
	}

	if (file[n] == "rx_bytes")
		action="received"
	else
		action="transmitted"

	printf "%s: %.2f %s ", action, $1/bytes[unit], units[unit]
}

END {
	printf "(on %s)\n", file[5]
}

#!/bin/bash
# some useful functions - Franco Venturi

function copy_files() {
    [ -f "$2" ] || return 1
    local_list="$local_tmpdir/filelist.$$"
    local_files="$local_tmpdir/files.$$"
    grep -v '^#' "$2" | grep -v '^ *$' > "$local_list" || return 2
    if [ -n "$1" ]; then
        # pull the files from extracted image
        (cd "$1" && tar -cj -f "$local_files" `cat $local_list`) || return 3
    else
        # pull the files directly from the device
        device_list="$device_tmpdir/filelist.$$"
        device_files="$device_tmpdir/files.$$"
        adb push "$local_list" "$device_list" || return 4
        adb shell "cd /system && tar -cj -f $device_files \`cat $device_list\`" || return 5
        adb pull "$device_files" "$local_files" || return 6
        adb shell "rm $device_list $device_files" || return 7
    fi

    # extract everything in the destination
    case "$3" in vendor/*) dest_dir="../../../$3";; *) dest_dir="$3";; esac
    [ -d "$dest_dir" ] || mkdir -p "$dest_dir" || return 8
    tar -xj -C "$dest_dir" -f "$local_files" || return 9

    # add entries to device-vendor-blobs
    if [ -n "$4" ]; then
        tar -tj -f "$local_files" | grep -v '/$' | sed -e "s|\(.*\)|    $3/\1:/system/\1 \\\\|" >> "$4" || return 10
    fi

    # done - final cleanup
    rm -f "$local_list" "$local_files" || return 11
    return 0
}

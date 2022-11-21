<?php

$dump = file_get_contents("gigaset_c430hx.bin");
$offset = 0;
@mkdir("midi-export");

while (true)
{
	$midi_header_pos = strpos($dump, "MThd", $offset);

	if ($midi_header_pos === false)
	{
		break;
	}

	$end = find_midi_end_at_offset($dump, $midi_header_pos);
	file_put_contents("midi-export/extract-".$midi_header_pos.".mid", substr($dump, $midi_header_pos, $end - $midi_header_pos));

	$offset = $end;
}


function find_midi_end_at_offset($dump, $offset)
{
	// skip midi header:
	// 4D 54 68 64 00 00 00 06 ff ff nn nn dd dd
	// M  T  h  d  [length]    [format] [n tracks] [delta ticks]
	$track_offset = $offset + 14;

	$number_of_tracks = unpack("n", substr($dump, $offset + 10, 2))[1];

	for ($current_track = 0; $current_track < $number_of_tracks; $current_track++)
	{
		error_log("Extracting MIDI track " . $current_track . " at " . $track_offset);
		$track_header = substr($dump, $track_offset, 8);
		$track_length = unpack("N", substr($track_header, 4))[1];

		error_log("Track " . $current_track . " has length of " . $track_length . " bytes");

		$track_offset += $track_length + 8;
	}

	error_log("MIDI file ends at " . $track_offset);

	return $track_offset;
}
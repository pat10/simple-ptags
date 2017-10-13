#!/usr/bin/env perl
use strict;
use warnings;

use 5.014;

say "Please enter the name of the txt file to convert to HTML paragraphs.";

chomp(my $file = <STDIN>);
my $input;

open($input, "<", $file) or die ("Whoops! $!\n");

my @changedText;

while (my @row = <$input>){
	#$changedText =~ s/$.\n/<p>$1<\\p>/;
	#@changedText = s/o*/e/g;
	#chomp(@changedText = $row);
	#say @changedText;
	@changedText = @row;
}

close($input);

my $newFile = "new-$file";
$newFile =~ s/\.txt/\.html/;

#open($output ">", "new-$file.html");

open(OUT, ">$newFile" || die ("Whoops! $!\n"));

foreach my $fileContents (@changedText){
	$fileContents =~ s#(.+)#<p>\1</p>#;
	print OUT $fileContents;
	#say $output $fileContents;
}

say "Finished. Go to $newFile in the current folder to get your HTML.";

close(OUT);

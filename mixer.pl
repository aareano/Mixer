$a = 10;
@words = qw/This is the syntax for here document and it will continue
until it encounters a EOF in the first line
This is case of double quote so variable value will be 
interpolated/;
# @words = qw/Extremely lenghty verbage becomes difficult to intepret and comprehend/;
@vowels = qw/a e i o u y/;
@consonants = qw/b c s d g h j k l m n p q r s t v w x z/;

=for comment

incomprehensible
incmprohenseible


if( $element ~~ @list )
=cut

for ($i = 0; $i < @words; $i++) {
	# print $words[$i] . " >> ";
	$words[$i] = &_mix_word($words[$i]);
	# print $words[$i] . "\n";
}

for ($i = 0; $i < @words; $i++) {
	print $words[$i] . "* *";
}

sub _mix_word {
	$word = $_[0];
	$mixed_word = $word;
	$len = length $mixed_word;
	@probabilities = (0.0) x length $mixed_word;

	for ($j = 0; $j < @probabilities; $j++) {
		$probabilities[$j] = (( $j <= $len / 2 ) ? $j : ($len - ($j + 1))) / $len;
	}
	for ($j = 0; $j < @probabilities; $j++) {
		for ($k = 0; $k < @probabilities; $k++) {
			
			$probOfSwap = $probabilities[$j] * $probabilities[$k];
			$threshold = 0.06;
			if (($j != $k) && $probOfSwap >= $threshold) {
				
				#swap letters
				$temp = substr($mixed_word, $k, 1);
				substr($mixed_word, $k, 1, substr($mixed_word, $j, 1));
				substr($mixed_word, $j, 1, $temp);
			}
		}
	}
	return $mixed_word;
}
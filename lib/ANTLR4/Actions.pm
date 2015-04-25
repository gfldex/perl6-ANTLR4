use v6;
class ANTLR4::Actions;

method DIGITS($/)
	{
	make +$/.Str
	}

#method COMMENT($/)
#	{
#	make ~$/
#	}

#method COMMENTS($/)
#	{
#	make ~$/.join.ast
#	}

method ID($/)
	{
	make ~$/
	}

#method NameChar($/)
#	{
#	}

#method NameStartChar($/)
#	{
#	}

method STRING_LITERAL($/)
	{
	make ~$/
	}

#method ESC_SEQ($/)
#	{
#	}

#method UNICODE_ESC($/)
#	{
#	}

#method ACTION($/)
#	{
#	}

#method ACTION_ESCAPE($/)
#	{
#	}

#method ACTION_STRING_LITERAL($/)
#	{
#	}

#method ACTION_CHAR_LITERAL($/)
#	{
#	}

#method ARG_ACTION($/)
#	{
#	}

#method LEXER_CHAR_SET($/)
#	{
#	}

method grammarType($/)
	{
	make $/[0] ?? ~$/[0] !! 'default'
	}

method TOP ($/)
	{
	my %prequel;
	if $<prequelConstruct>[0]
		{
		if $<prequelConstruct>[0]<optionsSpec>
			{
			%prequel<options> =
				$<prequelConstruct>[0]<optionsSpec>.ast.hash.item;
			}
	}
	make
		{
		name => $<grammarName>.ast,
		type => $<grammarType>.ast,
		%prequel
		};
	}

#method prequelConstruct($/)
#	{
#	}

method optionsSpec($/)
	{
	make $/<option>>>.ast.flat
	}

method option($/)
	{
	make $/<ID>.ast => $/<optionValue>.ast
	}

method ID_list($/)
	{
make [ 'b', 'c' ]
#	make [ @( $/<ID> ).map { $_.ast } ]
	}

method optionValue($/)
	{
	make
		$/<ID_list>
			?? $/<ID_list>.ast
			!! $/<STRING_LITERAL>
			?? $/<STRING_LITERAL>.ast
			!! $/<DIGITS>
			?? $/<DIGITS>.ast
			!! ''
	}
 
#method delegateGrammars($/)
#	{
#	}

#method delegateGrammar($/)
#	{
#	}

#method tokensSpec($/)
#	{
#	}

#method action($/)
#	{
#	}

#method actionScopeName($/)
#	{
#	}

#method modeSpec($/)
#	{
#	}

#method ruleSpec($/)
#	{
#	}

#method parserRuleSpec($/)
#	{
#	}

#method exceptionGroup($/)
#	{
#	}

#method exceptionHandler($/)
#	{
#	}

#method finallyClause($/) {
#	}
# 
#method ruleReturns($/) {
#	}
# 
#method throwsSpec($/) {
#	}
# 
#method localsSpec($/) {
#	}
# 
#method ruleModifier($/) {
#	}
# 
#method ruleAltList($/) {
#	}
# 
#method labeledAlt($/) {
#	}
# 
#method lexerRule($/) {
#	}
# 
#method lexerAltList($/) {
#	}
# 
#method lexerAlt($/) {
#	}
# 
#method lexerElement($/) {
#	}
# 
#method labeledLexerElement($/) {
#	}
# 
#method lexerBlock($/) {
#	}
# 
#method lexerCommands($/) {
#	}
# 
#method lexerCommand($/) {
#	}
# 
#method lexerCommandName($/) {
#	}
# 
#method lexerCommandExpr($/) {
#	}
# 
#method altList($/) {
#	}
# 
#method alternative($/) {
#	}
# 
#method element($/) {
#	}
# 
#method labeledElement($/) {
#	}
# 
#method ebnf($/) {
#	}
# 
#method ebnfSuffix($/) {
#	}
# 
#method lexerAtom($/) {
#	}
# 
#method atom($/) {
#	}
# 
#method notSet($/) {
#	}
# 
#method blockSet($/) {
#	}
# 
#method setElement($/) {
#	}
# 
#method block($/) {
#	}
# 
#method ruleref($/) {
#	}
#
#method range($/) {
#	}
# 
#method terminal($/) {
#	}
# 
#method elementOptions($/) {
#	}
# 
#method elementOption($/)
#	{
#	}
 
# vim: ft=perl6
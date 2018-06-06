syntax keyword gsqlKeyword accum order by asc desc where having post-accum
syntax keyword gsqlKeyword create drop add install alter select
syntax keyword gsqlIdentifier schema_change job query graph for attribute from as interval
syntax keyword gsqlStatement print load
syntax keyword gsqlConditional if then else end
syntax keyword gsqlRepeat foreach in while do
syntax keyword gsqlFunction neighbors neighborAttribute datetime_to_epoch
syntax keyword gsqlFunction datetime_add datetime_diff datetime_sub to_datetime

syntax keyword type int uint bool jsonobject jsonarray
syntax keyword type string
syntax keyword type double
syntax keyword type float
syntax keyword type datetime
syntax keyword type vertex
syntax keyword type edge
syntax keyword type SetAccum SumAccum MaxAccum AvgAccum OrAccum AndAccum BitwiseOrACcum
syntax keyword type BitwiseAndAccum ListAccum BagAccum MapAccum HeapAccum ArrayAccum GroupByAccum

syn region gsqlString start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match gsqlNumber "-\=\<[0-9]*\>"
syn match gsqlNumber "-\=\<[0-9]*\.[0-9]*\>"

syn region gsqlComment start="/\*" end="\*/"
syn match gsqlComment "//.*$"

highlight link gsqlKeyword Keyword
highlight link type Type
highlight link gsqlStatement Statement
highlight link gsqlIdentifier Identifier
highlight link gsqlConditional Conditional
highlight link gsqlRepeat Repeat
highlight link gsqlComment Comment
highlight link gsqlString String
highlight link gsqlNumber Number
highlight link gsqlFunction Function

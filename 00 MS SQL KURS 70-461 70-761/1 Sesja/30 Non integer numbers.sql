declare @myVar as decimal(10,4)
set @myVar = 1245.45
select @myVar

/*
Numericjest taki sam jak Decimal. Pozwalaj¹ one okreœliæ precyzjê i s¹ dobre, 
jeœli bêdziesz mieæ wiêcej ni¿ 2 miejsca po przecinku lub potrzebujesz wiêkszej precyzji ni¿ wskazana.

Moneyjest u¿ywany do, jak siê domyœlacie, pieniêdzy. Jeœli Twoim polem jest waluta, jest to w³aœciwe.
Moneyjest podobny do liczbowego/dziesiêtnego, z t¹ ró¿nic¹, ¿e jego skala jest sta³a: przechowuje 4 miejsca po przecinku z dok³adnoœci¹

Floatjest trochê specjalny i NIE nadaje siê do dok³adnych liczb. 
Jeœli potrzebujesz reprezentowaæ liczby zmiennoprzecinkowe, jest to dobry sposób. 
Jeœli musisz zawsze przechowywaæ dok³adnie to, co wk³adasz w pole, floatto z³y wybór.
*/
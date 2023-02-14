declare @myVar as decimal(10,4)
set @myVar = 1245.45
select @myVar

/*
Numericjest taki sam jak Decimal. Pozwalaj� one okre�li� precyzj� i s� dobre, 
je�li b�dziesz mie� wi�cej ni� 2 miejsca po przecinku lub potrzebujesz wi�kszej precyzji ni� wskazana.

Moneyjest u�ywany do, jak si� domy�lacie, pieni�dzy. Je�li Twoim polem jest waluta, jest to w�a�ciwe.
Moneyjest podobny do liczbowego/dziesi�tnego, z t� r�nic�, �e jego skala jest sta�a: przechowuje 4 miejsca po przecinku z dok�adno�ci�

Floatjest troch� specjalny i NIE nadaje si� do dok�adnych liczb. 
Je�li potrzebujesz reprezentowa� liczby zmiennoprzecinkowe, jest to dobry spos�b. 
Je�li musisz zawsze przechowywa� dok�adnie to, co wk�adasz w pole, floatto z�y wyb�r.
*/
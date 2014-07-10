# Creeert een lege array voor de inventory
@inventory = []
 
# Waar de speler commando's invoert
def prompt()
	print "Geef commando > "
end
 
# Geeft een lijst van commands bij het command help
def help()
	puts "Hier is een lijst handige commando's die je gaan helpen met je quest:"
	puts "ga (richting): Ga in de gespecificeerde richting"
	puts "open: open deuren, kisten, je hart, etc"
	puts "kijk: Krijg een beschrijving van de kamer waar je nu bent"
	puts "neem: Neem een item en stop het in je inventory"
	puts "gebruik X op X: Gebruik een item uit je inventory op een object"
	puts "inventory: Bekijk je inventory"
	puts "stop: Stop de game"
end
 
#Maakt het scherm leeg

    def clear
            require 'rbconfig'
            host_os = RbConfig::CONFIG['host_os']
            case host_os
           
            when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
            		puts "hallo"

                    system('cls')
            else
            		puts('mac')
                    system('clear')
            end
    end



# Stopt de game
def stop()
	Process.exit
end
 
# Laat de speler's items zien
def inventory()
	puts "Je hebt de volgende items:"
	puts @inventory
end
 
# Dit zijn alle ruimte's in de dungeon
def schatkamer
	if @sleutel_aanwezig
		puts "Je bent in een kleine, ronde kamer"
		puts "Voor je, op de grond, staat een lege kist"
		puts "Wat ga je doen"
	elsif !@sleutel_aanwezig
		puts "Je bent in een kleine, ronde kamer"
		puts "Voor je staat een kleine, houten kist."
		puts "Hij lijkt niet op slot te zitten"
		puts "Wat ga je doen"
		@kist_open = false
		@sleutel_aanwezig = false
	end
	 
	while true
		prompt; volgende_zet = gets.chomp
		if volgende_zet == "help"
			help; prompt; volgende_zet = gets.chomp
		end
		if volgende_zet == "inventory"
			inventory; prompt; volgende_zet = gets.chomp
		end
		if volgende_zet == "stop"
		stop;
		end
		if volgende_zet == "kijk"
			puts "In deze ruimte voel je je een beetje claustrofobisch"
			puts "Je ziet een kleine kist in het midden van de kamer"
			puts "Er is een uitgang naar het zuid-oosten"
		elsif !@kist_open and !@sleutel_aanwezig and volgende_zet == "open kist"
			puts "In de kist vindt je een kleine, verweerde sleutel"
			@kist_open = true
		elsif @kist_open and !@sleutel_aanwezig and volgende_zet == "neem sleutel"
			puts "Je pakt de sleutel en doet hem in je zak."
			@sleutel_aanwezig = true
			@inventory << "Verweerde sleutel"
		elsif volgende_zet == "Ga zuid-oosten"
			
		else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
		end
	end
end
 
def podium_ruimte
	puts "Deze ruimte is net iets te heet."
	puts "Er is een podium van steen in het noorden van de kamer."
	puts "Je ziet de vage lijnen van een deur naast het podium."
	puts "Wat ga je doen"
	@geheime_deur_open = false
while true
	prompt; volgende_zet = gets.chomp
		if volgende_zet == "help"
			help; prompt; volgende_zet = gets.chomp
		end
		if volgende_zet == "inventory"
			inventory; prompt; volgende_zet = gets.chomp
		end
		if volgende_zet == "stop"
			stop;
		end
		if !@geheime_deur_open and volgende_zet == "kijk"
			puts "Het grootste deel van deze warme ruimte wordt ingenomen door het stenen podium"
			puts "Op het podium ligt een dikke laagf stof"
			puts "Je ziet de vage uitlijning van een deur naast het stenen podium"
			puts "Er is een uitgang naar het zuiden."
		elsif @geheime_deur_open and volgende_zet == "kijk"
			puts "Het grootste deel van deze warme ruimte wordt ingenomen door het stenen podium"
			puts "Op het podium ligt een dikke laagf stof"
			puts "Een geheime deur naast het podium heeft zich kenbmaar gemaakt"
			puts "Er zijn uitgangen naar het zuiden en noorden."
		elsif !@bol_aanwezig and volgende_zet.include? "podium"
			puts "Je onderzoekt het podium, en vindt een kleine markering in het midden,"
			puts "Maar je hebt geen idee wat je daar op dit moment mee kan"
		elsif volgende_zet.include? "uitlijning"
			puts "Je ziet de uitlijning van een deur naast het podium zeer duidelijk,"
			puts "maar kan geen manier vinden om de deur te openen."
		elsif @bol_aanwezig and volgende_zet == "Gebruik bol op uitlijning"
			puts "Je plaatst de kleine, zilveren bol voorzichtig op de deur"
			puts "De bol draait rond, en komt terecht op de uitlijning in het midden van het podium"
			puts "Met een grommend geluid, gaat de deur, rechts van het podium, open."
			@geheime_deur_open = true
			@inventory.delete("Silver Orb")
		elsif volgende_zet == "ga noorden" and @geheime_deur_open
			moeras_ruimte()
			Process.exit(0)
		elsif volgende_zet == "ga zuiden"
			vage_kamer()
		else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
		end
	end
end
 
def bol_kamer
	puts "Deze kamer is zeer koud."
	puts "De ruimte is klein, vierkant, en heel stoffig."
	puts "Je ziet een staand ornament in een hoek."
	@bol_aanwezig = false
	@ornament_verplaatst = false
	@zaden_aanwezig = false
	 
	while true
		prompt; volgende_zet = gets.chomp
	if volgende_zet == "help"
		help; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "inventory"
		inventory; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "stop"
		stop;
	end
	if !@bol_aanwezig and !@ornament_verplaatst and volgende_zet == "kijk"
		puts "Op het ornament staat een kleine, zilveren bol."
		puts "Het grootste deel van deze ruimte is bedekt met dikke lagen stof"
		puts "Wanneer je beter kijkt, zie je iets geks"
		puts "Rond de onderkant van de bol ligt geen stof"
		puts "Alsof de bol kort geleden nog bewogen is..."
		puts "Er is een uitgang naar het zuid-westen"
	elsif !@bol_aanwezig and !@ornament_verplaatst and volgende_zet == "kijk"
		puts "Het ornament dat de bol vasthoudt staat in een hoek"
		puts "Het grootste deel van deze ruimte is bedekt met dikke lagen stof"
		puts "Wanneer je beter kijkt, zie je iets geks"
		puts "Rond de onderkant van de bol ligt geen stof"
		puts "Alsof de bol kort geleden nog bewogen is..."
		puts "Er is een uitgang naar het zuid-westen"
	elsif @bol_aanwezig and @ornament_verplaatst and volgende_zet == "kijk"
		puts "Je hebt het ornament van de muur verplaatst."
		puts "Het grootste deel van deze kamer is bedekt met dikke lagen stof"
		puts "Er is een uitgang naar het zuid-westen"
	elsif !@bol_aanwezig and @ornament_verplaatst and volgende_zet == "kijk"
		puts "Op het ornament staat een kleine, zilveren bol."
		puts "Je hebt het ornament van de muur verplaatst."
		puts "Het grooste deel van deze kamer is bedekt met dikke lagen stof"
		puts "Er is een uitgang naar het zuid-westen"
	elsif !@bol_aanwezig and volgende_zet == "neem bol"
		puts "Je pakt de orb van het ornament af"
		puts "De orb is koud, bijna zo koud dat het pijn doet."
		puts "Je vouwt een lap stof om de bol heen, en doet hem in je zak."
		@bol_aanwezig = true
		@inventory << "Zilveren bol"
	elsif !@ornament_verplaatst and volgende_zet.include? "move" and volgende_zet.include? "ornament"
		puts "Met veel moeite duw je het ornament aan de kant."
		puts "Verborgen in een gat achter het ornament, vindt je een klein kistje"
		@ornament_verplaatst = true
	elsif @ornament_verplaatst and !@zaden_aanwezig and volgende_zet == "neem kistje"
		puts "Je pakt het kleine kistje"
		puts "In het kleine kistje, vindt je een handvol zaadjes."
		puts "Je stopt de zaadjes in je zak"
		@zaden_aanwezig = true
		@inventory << "Zaadjes"
	elsif volgende_zet == "ga zuid-westen"
		vage_kamer()
	else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
	end
  end
end
 
def start
	puts "Je wordt wakker in een grote, donkere kamer met een natte vloer"
	puts "Je weet niet zeker hoe of wanneer je hier gekomen bent."
	puts "Het laatste wat je je kan herrineren, is dat je naar huis liep in het donker,"
	puts "en een scherp object in je nek voelde."
	vage_kamer()
	clear()
end
 
def vage_kamer
	puts "Deze kamer wordt vaag verlicht door twee fakkels"
	puts "Er zijn drie deuren hier vandaan"
	puts "Wat ga je doen (typ 'help' voor hulp)"
	@door_unlocked = false
	while true
	prompt; volgende_zet = gets.chomp
		if volgende_zet == "god_mode"
			god_mode; prompt; volgende_zet = gets.chomp
		end
		if volgende_zet == "help"
			help; prompt; volgende_zet = gets.chomp
		end
		if volgende_zet == "inventory"
			inventory; prompt; volgende_zet = gets.chomp
		end
		if volgende_zet == "stop"
			stop;
		end
		if volgende_zet == "kijk"
			puts "Dit is de kamer waarin je wakker bent geworden."
			puts "Het is een lange, rechthoekige kamer"
			puts "Er zijn uitgangen in het noorden, noord-oosten en noord-westen."
			puts "Boven je hoofd zie je de vage uitlijningen van een valdeur,"
			puts "maar het plafond is te hoog. Je zit hier vast."
		elsif volgende_zet == "ga noord-westen"
			schatkamer()
		elsif volgende_zet == "ga noorden"
			podium_ruimte()
		elsif @sleutel_aanwezig and volgende_zet == "gebruik sleutel op deur"
			puts "De sleutel die je gevonden hebt, past precies in het slot."
			puts "Met een klik open je de deur."
			@door_unlocked = true
		elsif !@door_unlocked and volgende_zet == "ga noord-oosten"
			puts "De deur zit gaed dicht."
			puts "Je moet een manier vinden om de deur te openen, als je hier ooit weg wil.."
		elsif @door_unlocked and volgende_zet == "ga noord-oosten"
			bol_kamer()
		else
			puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
		end
	end
end
 
def moeras_ruimte
	puts "Je staat in een lange, nauwe gang"
	puts "Er zijn uitgangen naar het noorden en zuiden."
	puts "Er is een grote plas water richting het westen"
	puts "Je ziet een opening in het plafond. Althans, dat denk je"
	puts "Het gat is boven de plas water."
	@liaan_aanwezig = false
	while true
		prompt; volgende_zet = gets.chomp
	if volgende_zet == "help"
		help; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "inventory"
		inventory; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "stop"
		stop;
	end
	if volgende_zet == "kijk"
		puts "Het water in de plas is te modderig om details te kunnen zien."
		puts "Er stijgen bubbels op in het water."
		puts "Er zijn uitgangen naar het zuiden, noorden en oosten."
		puts "Er is een opening in het plafond boven de plas."
	elsif volgende_zet == "ga noorden"
		water_kamer()
	elsif volgende_zet == "ga oosten"
		trap_kamer()
	elsif volgende_zet == "ga zuiden"
		podium_ruimte()
	elsif @zaden_aanwezig and volgende_zet == "gebruik zaadjes op water"
		puts "Je gaoit de zaadjes in de plas"
		puts "Even gebeurt er niks, maar dan begrint de grond te bewegen"
		puts "Enorme lianen barsten uit het water"
		puts "In de richting van het plafond. De richting van het gat."
		@liaan_aanwezig = true
		@inventory.delete("zaadjes")
	elsif !@liaan_aanwezig and volgende_zet == "ga naar boven"
		puts "Je begint aan de lianen naar boven te klimmen"
		puts "Na een paar meter, voelt het alsof iemand je been vast heeft."
		puts "En nog erger: Het blijkt een beest te zijn! Met tentakels!"
		puts "Het monster sleurt je het water in."
		dood()
	elsif @liaan_aanwezig and volgende_zet == "ga naar boven"
		gezicht_kamer()
	else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
	end
  end
end
 
def trap_kamer
	puts "Je ziet een wenteltrap die naar beneden gaat, richting het zuid-oosten"
	@knop_ingedrukt = false
	while true
		prompt; volgende_zet = gets.chomp
	if volgende_zet == "help"
		help; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "inventory"
		inventory; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "stop"
		stop;
	end
	if volgende_zet == "kijk"
		puts "Het grootste gedeelte van deze ruimte wordt ingenomen door een trap die zuidelijk gaat."
		puts "Als je beter kijkt, zie je een knop aan de bovenkant van de trap."
		puts "Er is een uitgang naar het westen.."
	elsif volgende_zet == "druk knop"
		puts "Je drukt de kleine knop in"
		puts "Je hoort stukjes metaal langs elkaar schuren, in de verte."
		@knop_ingedrukt = true
	elsif !@knop_ingedrukt and volgende_zet == "ga naar beneden"
		puts "Terwijl je naar beneden loopt, voel je de grond trillen"
		puts "De trap stort in, en valt naar beneden"
		puts "Je kan niks vinden om je aan vast te houden, en valt dus langzaam naar beneden"
		puts "Je slikt, maar weet dat er geen ontkomen meer aan is, "
		puts "als de geraamtes beneden ziet liggen."
		dood()
	elsif @knop_ingedrukt and volgende_zet == "ga naar beneden"
		grot_kamer()
	elsif volgende_zet == "ga west"
		moeras_ruimte()
	else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
	end
  end
end
 
def grot_kamer
	puts "Je volgt de trap naar beneden"
	puts "Voor je zie je een groot gat in de grond"
	puts "Er is een kleine inkeping in de muur naast je"
	@rood_juweel_aanwezig = false
	while true
		prompt; volgende_zet = gets.chomp
	 
	if volgende_zet == "help"
		help; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "inventory"
		inventory; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "stop"
		stop;
	end
	if volgende_zet == "kijk"
		puts "Je staat aan de donkere onderkant van een trap"
		puts "In het westen is een gat in de grond, en in het noorden een kleine inkeping in de muur"
		puts "Het is niet te zien hoe diep het gat is"
		puts "Je ziet een blinkend rood juweel in de grot"
	elsif volgende_zet == "neem juweel"
	puts "YJe pakt het rode juweel, staart er even naar, zegt 'my precious', en stopt het daarna in je zak"
	@rood_juweel_aanwezig = true
	@inventory << "Rood juweel"
	elsif volgende_zet == "ga naar boven"
	trap_kamer()
	else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
	end
	end
end
 
def water_kamer
	puts "Je staat in een vierkanten kamer, met een stenen richel tegen een van de muren"
	puts "Er zijn drie ronde gaten boven de richel"
	puts "De gaten zijn te donker om goed in te kijken, maar je kan er wel je hand in steken.."
	@blauw_juweel_aanwezig = false
	while true
		prompt; volgende_zet = gets.chomp
	if volgende_zet == "help"
		help; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "inventory"
		inventory; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "stop"
		stop;
	end
	if volgende_zet == "kijk"
		puts "Je ziet drie gaten op een rij, boven de richel"
		puts "De gaten zijn te donker om goed in te kijken"
		puts "Er is iets geks aan het linker gat"
		puts "Het middelste hol is heel diep"
		puts "Uit het rechter gat komt een zachte bries van naar metaal ruikende wind."
		puts "Er is een uitgang in het zuiden"
	elsif !@blauw_juweel_aanwezig and volgende_zet.include? "linker gat"
		puts "Je steekt je hand voorzichtig in het linker gat, en je voelt iets ronds en hards."
		puts "Wanneer je het object uit het gat haalt, blijkt het een prachtig glansende blauwe diamant te zijn!"
		@blauw_juweel_aanwezig = true
		@inventory << "Blauw juweel"
	elsif volgende_zet.include? "Middelste gat"
		puts "Je steekt je hand voorzichtig in het middelste gat, end zoekt er rond"
		puts "Je voelt ineens een scherpe, stekende pijn, alsof iets je gebeten heeft"
		puts "Het laatste dat je ziet voordat je sterft is een groep spinnen die je arm op komt lopen."
		dood()
	elsif volgende_zet.include? "rechter gat"
		puts "Je steekt je hand voorzichtig in het linker gat, en voelt hier rond"
		puts "Plotseling voel je iets boven je hand bewegen"
		puts "Een vernietigende kracht valt neer op je arm, het vast zettend in het gat."
		puts "Gelukkig duurt het maar een paar weken om van dorst te sterven."
		dood()
	elsif volgende_zet == "ga zuiden"
		moeras_ruimte()
	else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
	end
  end
end
 
def gezicht_kamer
	puts "In de noordelijke muur van deze vierkante ruimte, staat in de muur een groot, stenen gezicht"
	puts "Waar de ogen moeten zitten, zit nu niks"
	puts "Rond de mond van het gezicht zit bloed"
	puts "In een hoek van de kamer ligt een menselijk geraamte."
	@zwaard_aanwezig = false
	@rood_juweel_geplaatst = false
	@blauw_juweel_geplaatst = false
	while true
		prompt; volgende_zet = gets.chomp
	if volgende_zet == "help"
		help; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "inventory"
		inventory; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "stop"
		stop;
	end
	if volgende_zet == "kijk"
		puts "Het lijkt wel alsof er iets in de ogen geplaatst moet worden"
		puts "Het geraamte lijkt van een avonturier te zijn"
		puts "Je ziet ook wat er nog over is van zijn spullen, inclusief een zwaard"
		puts "Er is een trap naar beneden."
	elsif volgende_zet == "neem zwaard"
		puts "Je pakt het zwaard en doet tussen je riem en je broek. Je voelt je als een echte avonturier"
		@zwaard_aanwezig = true
		@inventory << "Zwaard"
	elsif !@blauw_juweel_geplaatst and volgende_zet == "Gebruik rood juweel op hoofd"
		puts "Het rode juweel past precies in het linker oog. Je plaatst het juweel"
		puts "Met gerommel, opend de mond van het gezicht. Je ziet een donkere gang naar het noorden"
		@rood_juweel_geplaatst = true
	elsif @blauw_juweel_geplaatst and volgende_zet == "Gebruik rood juweel op hoofd"
		puts "Wanneer je het juweel plaatst, hoor je een zacht geluid"
		puts "Het klinkt bijna als tevreden gegrom van het hoofd"
		@juwelen_geplaatst = true
		@inventory.delete("rood juweel")
	elsif !@rood_juweel_geplaatst and volgende_zet == "Gebruik blauw juweel op hoofd"
		puts "Het blauwe juweel past precies in het rechter oog van het hoofd"
		puts "Met een grom opent de mond van het hoofd. Erachter een donkere gang richting het noorden"
		@blauw_juweel_geplaatst = true
	elsif @rood_juweel_geplaatst and volgende_zet == "Gebruik blauw juweel op hoofd"
		puts "Wanneer je het blauwe juweel in het recher oog plaatst, hoor je een zacht geluid"
		puts "Het klinkt bijna als tevreden gegrom van het hoofd"
		@juwelen_geplaatst = true
		@inventory.delete("blauw juweel")
	elsif !@juwelen_geplaatst and volgende_zet == "ga noordelijk"
		puts "Je kruipt door de donkere gang. Plotseling hoor je wat achter je"
		puts "De mond van het hoofd sluit achter je, en je zit opgesloten."
		dood()
	elsif @juwelen_geplaatst and volgende_zet == "ga noordelijk"
		spinnen_kamer()
	elsif volgende_zet == "ga omlaag"
		moeras_ruimte()
	end
  end
end
 
def spinnen_kamer
	puts "In deze kamer hang een gigantisch spinnenweb, dat van het plafond tot de vloer reikt."
	puts "In het midden van het web hangt een gigantische spin"
	puts "De spinder kijkt lustig in jouw richting"
	@spider_dood = false
	while true
		prompt; volgende_zet = gets.chomp
	if volgende_zet == "help"
		help; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "inventory"
		inventory; prompt; volgende_zet = gets.chomp
	end
	if volgende_zet == "stop"
		stop;
	end
	if !@spider_dood and volgende_zet == "kijk"
		puts "Er zit een grote spin in het midden van het web"
		puts "Het lijkt klaar te zijn om aan te vallen"
		puts "Je ziet een uitgang achter het web"
	elsif @spider_dood and volgende_zet == "kijk"
		puts "Het bloedende lichaam van de spin ligt op de grond"
		puts "Er zijn uitgangen naar het zuiden en noorden"
	elsif @zwaard_aanwezig and volgende_zet == "gebruik zwaard op spin" or volgende_zet == "val spin aan"
		puts "Je rent naar het gedrocht, met je zwaard geheven."
		puts "Het zwaard begint te gloeien, en dan steek je het diep in de maag van de spin."
		puts "Het gedrocht gilt nog verschrikkelijk, maar dan valt het dood neer"
		@spider_dood = true
	elsif !@zwaard_aanwezig and volgende_zet == "gebruik zwaard op spin" or volgende_zet == "val spin aan"
		puts "Je rent naar het gedrocht toe, met je vuist in de aanslag"
		puts "De spin lijkt haast te grinniken, terwijl je naar hem toe rent"
		puts "Hij steekt zijn tanden in je nek. Dit was het."
		dood()
	elsif !@spider_dood and volgende_zet == "ga noordelijk"
		puts "Je probeert lang de spin te sneaken, hopend dat het je niet ziet."
		puts "Helaas ziet hij je wel, een voordat je het weet lig je verlamd op de grond"
		puts "en wordt je in zijde gewikkeld.."
		dood()
	elsif @spider_dood and volgende_zet == "ga noordelijk"
		puts "De gang is lang, en donker"
		puts "Na een tijdje door de gang lopen, zie je licht aan het einde van de tunnel"
		puts "Ja! Je hebt de uitgang gevonden!"
		puts "Gefeliciteerd!"
		Process.exit
	elsif volgende_zet == "ga south"
		gezicht_kamer()
	end
  end
end
 
# Als de speler dood gaat, treedt deze functie in werking
def dood
	puts "Je bent dood. Was dat wat je net deed wel zo slim?"
	puts "Wil je het nog eens proberen?"
	while true
	prompt; volgende_zet = gets.chomp
	if volgende_zet == "ja"
	start()
	clear()
	elsif volgende_zet == "nee"
	Process.exit
	else puts "Ik snap niet wat je bedoelt. Gebruik het commando 'help' voor hulp."
	end
  end
end
 
start()
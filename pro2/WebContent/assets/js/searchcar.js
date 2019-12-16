function makeChange() {
				var Hyundai = ["Grandeur","Sonata","Avante","Santafe"];
				var Kia = ["Moring","Carnival","Sorento"];
				var Chevrolet = ["Spark","Cruse","Martise"];
				var Samsung = ["SM3","SM5","SM7"];
				var Ssangyong = ["Rexton","Musso","Korando","Tivoli"];
				var Benz = ["A Class","E Class","CLS Class"];
				var BMW = ["3 Series","5 Series","7 Series","X5"];
				var Volkswagen = ["Passat","Golf","Tiguan"];
				
				var selectItem = $("#selectmake option:selected").val();
				var changeItem;
				  
				if(selectItem == 'Hyundai'){
				  changeItem = Hyundai;
				} else if(selectItem == "Kia"){
				  changeItem = Kia;
				} else if(selectItem == "Chevrolet(GM DaeWoo)"){
				  changeItem = Chevrolet;
				} else if(selectItem == "Renault Samsung"){
				  changeItem = Samsung;
				} else if(selectItem == "Ssangyong"){
				  changeItem = Ssangyong;
				} else if(selectItem == "Benz"){
				  changeItem = Benz;
				} else if(selectItem == "BMW"){
				  changeItem = BMW;
				} else if(selectItem == "Volkswagen"){
				  changeItem = Volkswagen;
				}	
				
				$('#selectmodel').empty();
				$('#selectdmodel').empty();
				
				for(var count = 0; count < changeItem.length; count++){ 
					var option = $("<option>"+changeItem[count]+"</option>");
				  	$('#selectmodel').append(option);
				} 
			}
			
			function modelChange() {
				var Grandeur = ["IG","HG","TG","XG"]; var Sonata = ["DN8","New rise","LF","NF"]; var Avante = ["AD","MD","HD","XD"];
				var Santafe = ["TM","The prime","DM","CM"]; var Moring = ["All New","The New","New"]; var Carnival = ["All New","The New","New","R","Grand"];
				var Sorento = ["All New","The New","New","R","New R"]; var Spark = ["The New","The Next","EV"]; var Cruse = ["All New","Amazing","New","5"];
				var Matise = ["All New","Creative","Classic","2"]; var SM3 = ["Neo","Z.E.","New","New Generation"]; var SM5 = ["Nova","New Platinum"];
				var SM7 = ["All New","New Art","Nova"]; var Rexton = ["Sport","G4","W","Super"]; var Musso = ["Sport","New","Grand"];
				var Korando = ["Beautiful","Sport","Turismo","New"]; var Tivoli = ["Air","Armour","Very New"]; var AClass = ["W177","W176","W169","W168"];
				var EClass = ["W213","W212","W211","W210","W124"]; var CLSClass = ["C257","W218","W219"]; var Series3 = ["G20","F30","E90"];
				var Series5 = ["G30","F10","E60"]; var Series7 = ["G11","F01","E65"]; var X5 = ["G05","F15","E70","E53"];
				var Passat = ["GT(B8)","The New","New","TSI"]; var Golf = ["4th","5th","6th","7th"]; var Tiguan = ["New","2th","All Space"];
				
				var selectItem = $("#selectmodel option:selected").val();
				var changeItem;
				  
				if(selectItem == 'Grandeur'){
				  changeItem = Grandeur;
				} else if(selectItem == "Sonata"){
				  changeItem = Sonata;
				} else if(selectItem == "Avante"){
				  changeItem = Avante;
				} else if(selectItem == "Santafe"){
				  changeItem = Santafe;
				} else if(selectItem == "Moring"){
				  changeItem = Moring;
				} else if(selectItem == "Carnival"){
				  changeItem = Carnival;
				} else if(selectItem == "Sorento"){
				  changeItem = Sorento;
				} else if(selectItem == "Spark"){
				  changeItem = Spark;
				} else if(selectItem == "Cruse"){
				  changeItem = Cruse;
				} else if(selectItem == "Matise"){
				  changeItem = Matise;
				} else if(selectItem == "SM3"){
				  changeItem = SM3;
				} else if(selectItem == "SM5"){
				  changeItem = SM5;
				} else if(selectItem == "SM7"){
				  changeItem = SM7;
				} else if(selectItem == "Rexton"){
				  changeItem = Rexton;
				} else if(selectItem == "Musso"){
				  changeItem = Musso;
				} else if(selectItem == "Korando"){
				  changeItem = Korando;
				} else if(selectItem == "Tivoli"){
				  changeItem = Tivoli;
				} else if(selectItem == "A Class"){
				  changeItem = AClass;
				} else if(selectItem == "E Class"){
				  changeItem = EClass;
				} else if(selectItem == "CLS Class"){
				  changeItem = CLSClass;
				} else if(selectItem == "3 Series"){
				  changeItem = Series3;
				} else if(selectItem == "5 Series"){
				  changeItem = Series5;
				} else if(selectItem == "7 Series"){
				  changeItem = Series7;
				} else if(selectItem == "X5"){
				  changeItem = X5;
				} else if(selectItem == "Passat"){
				  changeItem = Passat;
				} else if(selectItem == "Golf"){
				  changeItem = Golf;
				} else if(selectItem == "Tiguan"){
				  changeItem = Tiguan;
				}
				
				
				$('#selectdmodel').empty();

				for(var count = 0; count < changeItem.length; count++){ 
					var option = $("<option>"+changeItem[count]+"</option>");
				  	$('#selectdmodel').append(option);
				} 
			}
			

&НаКлиенте
Процедура Выбрать(Команда)
	
	БуферРезультата = Новый БуферДвоичныхДанных(1);
	БуферРезультата[0] = 0;
	
	Буфер = Новый БуферДвоичныхДанных(5);
	Буфер[0] = ?(Локальная,1,0); // Локальная
	Буфер[1] = ?(СистемноеПеречисление,2,0); // Внешняя
	Буфер[2] = ?(ПараметрМетода,4,0); // Параметр метода
	Буфер[3] = ?(ПоЗначению,8,0); // Знач
	Буфер[4] = ?(Экспортная,16,0); // Экспорт
	
	БуферРезультата.ЗаписатьПобитовоеИли(0, Буфер.ПолучитьСрез(0,1));
	БуферРезультата.ЗаписатьПобитовоеИли(0, Буфер.ПолучитьСрез(1,1));
	БуферРезультата.ЗаписатьПобитовоеИли(0, Буфер.ПолучитьСрез(2,1));
	БуферРезультата.ЗаписатьПобитовоеИли(0, Буфер.ПолучитьСрез(3,1));
	БуферРезультата.ЗаписатьПобитовоеИли(0, Буфер.ПолучитьСрез(4,1));
	
	ОповеститьОВыборе(БуферРезультата[0]);
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ТекЗначение = Параметры.ТекущееЗначение;
	
	// На 8.3.10 нет глобальных функций
	Буфер = Новый БуферДвоичныхДанных(5);
	Буфер[0] = 1; // Локальная
	Буфер[1] = 2; // Внешняя
	Буфер[2] = 4; // Параметр метода
	Буфер[3] = 8; // Знач
	Буфер[4] = 16; // Экспорт
	
	БуферЗначения = Новый БуферДвоичныхДанных(1);
	БуферЗначения[0] = ТекЗначение;
	
	Буфер.ЗаписатьПобитовоеИ(0, БуферЗначения);
	Буфер.ЗаписатьПобитовоеИ(1, БуферЗначения);
	Буфер.ЗаписатьПобитовоеИ(2, БуферЗначения);
	Буфер.ЗаписатьПобитовоеИ(3, БуферЗначения);
	Буфер.ЗаписатьПобитовоеИ(4, БуферЗначения);
	
	Локальная = Буфер[0];
	СистемноеПеречисление = Буфер[1];
	ПараметрМетода = Буфер[2];
	ПоЗначению = Буфер[3];
	Экспортная = Буфер[4];
	
КонецПроцедуры

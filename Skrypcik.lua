wyniki = {}
-- Reakcja na zniszczenie samolotu przeciwnika
--EVENTHANDLER={}

deduwa = EVENTHANDLER:New()
deduwa:HandleEvent(EVENTS.Kill)

function deduwa:OnEventKill(EventData)
    gracz = EventData.IniPlayerName
    MESSAGE:New(" gracz = " .. EventData.IniPlayerName .. " ", 20):ToAll()


    --"20" czas wyświetlania wiadomości
    if wyniki[gracz] == nil then
        wyniki[gracz] = 1
    else
        wyniki[gracz] = wyniki[gracz] + 1
    end
    MESSAGE:New(" gracz wynik = " .. wyniki[gracz] .. " ", 20):ToAll()
end

-- Reset licznika jeśli (trzeba zamienić na eventDeath)
function deduwa:OnEventKill(EventData)
    gracz = EventData.TgtPlayerName
    MESSAGE:New(" gracz zabity = " .. gracz .. " ", 20):ToAll()

    if wyniki[gracz] ~= nil then
        wyniki[gracz] = nil
    end
end

-- Reset licznika jak zmieni slota
podrabiana_deduwa = EVENTHANDLER:New()
podrabiana_deduwa:HandleEvent(EVENTS.PlayerEnterAircraft)

function podrabiana_deduwa:OnEventPlayerEnterAircraft(EventData)
    gracz = EventData.IniPlayerName
    MESSAGE:New(" gracz śmierć = " .. EventData.IniPlayerName .. " ", 20):ToAll()
    Wyniki[gracz] = nil
end

--Do zrobienia:
--1. Warunek dla eventhandlera czy koles nie zginal (jak zginie zaczyna liczyc od nowa)
--2. Ma zliczac tylko samoloty
--3. Pomijanie pierwszego killa (liczy do 5 dla kadzego inny komunikat na 6 Nagroda)
--4. Dodanie dzwiekow
--5. Nagroda za serie zabojstw




EventHandler = EVENTHANDLER:New()
EventHandler:HandleEvent(EVENTS.Dead)
function EventHandler:OnEventDead(EventData)
    BASE:I(EventData)
end

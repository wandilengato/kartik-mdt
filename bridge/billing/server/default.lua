function DefaultFinePerson(source, citizenId, fine)
    if removeBankMoney(citizenId, fine) then
        return {success = true} -- return true when fined
    end
    return {success = false}
end

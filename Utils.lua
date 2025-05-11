jokerPath = 'Jokers/'

function AUtils.Joker (joker)
    SMODS.load_file(jokerPath .. joker .. ".lua")()
end

-- Taken from Pokermon pokefunctions.lua poke_total_chips
function AUtils.TotalChips (card)
  local total_chips = (card.ability.bonus) + (card.ability.perma_bonus or 0)
  if card.ability.effect ~= 'Stone Card' and not card.config.center.replace_base_card then
    total_chips = total_chips + (card.base.nominal)
  end
  if card.edition then
    total_chips = total_chips + (card.edition.chips or 0)
  end
  return total_chips
end

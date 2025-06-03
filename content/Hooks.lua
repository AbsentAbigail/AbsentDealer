-- Round based random effects
local init_game_object_reference = Game.init_game_object
function Game:init_game_object()
	local ret = init_game_object_reference(self)
	init_seal_hand(ret)
	init_glowing_shard_hand(ret)
	init_imagination_hand(ret)
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	reset_seal_hand()
    reset_glowing_shard_rank()
    reset_imagination_rank()
end

-- Kiki context hook
local ease_dollars_reference = ease_dollars
function ease_dollars(mod, instant)
    local ret = ease_dollars_reference(mod, instant)
    for _, joker in ipairs(G.jokers.cards) do
        eval_card(joker, {ad_earn_money = mod})
    end
    return ret
end
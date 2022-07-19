#define PHOBIA_FILE "phobia.json"

/// Phobia types that can be pulled randomly for brain traumas.
/// Also determines what phobias you can choose as your preference with the quirk.
GLOBAL_LIST_INIT(phobia_types, sort_list(list(
	"aliens",
	"anime",
	"authority",
	"birds",
	"blood",
	"clowns",
	"doctors",
	"falling",
	"greytide",
	"guns",
	"insects",
	"lizards",
	"robots",
	"security",
	"skeletons",
	"snakes",
	"space",
	"spiders",
	"strangers",
	"the supernatural",
)))

GLOBAL_LIST_INIT(phobia_regexes, list(
	"aliens" = construct_phobia_regex("aliens"),
	"anime" = construct_phobia_regex("anime"),
	"authority" = construct_phobia_regex("authority"),
	"birds" = construct_phobia_regex("birds"),
	"clowns" = construct_phobia_regex("clowns"),
	"conspiracies" = construct_phobia_regex("conspiracies"),
	"doctors" = construct_phobia_regex("doctors"),
	"falling" = construct_phobia_regex("falling"),
	"greytide" = construct_phobia_regex("greytide"),
	"guns" = construct_phobia_regex("guns"),
	"insects" = construct_phobia_regex("insects"),
	"lizards" = construct_phobia_regex("lizards"),
	"ocky icky" = construct_phobia_regex("ocky icky"),
	"robots" = construct_phobia_regex("robots"),
	"security" = construct_phobia_regex("security"),
	"skeletons" = construct_phobia_regex("skeletons"),
	"snakes" = construct_phobia_regex("snakes"),
	"space" = construct_phobia_regex("space"),
	"spiders" = construct_phobia_regex("spiders"),
	"strangers" = construct_phobia_regex("strangers"),
	"the supernatural" = construct_phobia_regex("the supernatural"),
	"blood" = construct_phobia_regex("blood"),
))

GLOBAL_LIST_INIT(phobia_mobs, list(
	"spiders" = typecacheof(list(/mob/living/simple_animal/hostile/giant_spider)),
	"security" = typecacheof(list(/mob/living/simple_animal/bot/secbot)),
	"lizards" = typecacheof(list(/mob/living/simple_animal/hostile/lizard)),
	"skeletons" = typecacheof(list(/mob/living/simple_animal/hostile/skeleton)),
	"snakes" = typecacheof(list(/mob/living/simple_animal/hostile/retaliate/snake)),
	"robots" = typecacheof(list(
		/mob/living/silicon/ai,
		/mob/living/silicon/robot,
		/mob/living/simple_animal/bot,
		/mob/living/simple_animal/drone,
	)),
	"doctors" = typecacheof(list(/mob/living/simple_animal/bot/medbot)),
	"the supernatural" = typecacheof(list(
		/mob/dead/observer,
		/mob/living/simple_animal/bot/mulebot/paranormal,
		/mob/living/simple_animal/hostile/construct,
		/mob/living/simple_animal/hostile/dark_wizard,
		/mob/living/simple_animal/hostile/faithless,
		/mob/living/simple_animal/hostile/imp,
		/mob/living/simple_animal/hostile/retaliate/bat,
		/mob/living/simple_animal/hostile/retaliate/ghost,
		/mob/living/simple_animal/hostile/skeleton,
		/mob/living/simple_animal/hostile/wizard,
		/mob/living/simple_animal/hostile/zombie,
		/mob/living/simple_animal/revenant,
		/mob/living/simple_animal/shade,
	)),
	"aliens" = typecacheof(list(
		/mob/living/carbon/alien,
		/mob/living/simple_animal/slime,
	)),
	"conspiracies" = typecacheof(list(
		/mob/living/simple_animal/bot/secbot,
		/mob/living/simple_animal/drone,
		/mob/living/simple_animal/pet/penguin,
	)),
	"birds" = typecacheof(list(
		/mob/living/simple_animal/chick,
		/mob/living/simple_animal/chicken,
		/mob/living/simple_animal/parrot,
		/mob/living/simple_animal/pet/penguin,
	)),
	"anime" = typecacheof(list(/mob/living/simple_animal/hostile/guardian)),
	"insects" = typecacheof(list(
		/mob/living/basic/cockroach,
		/mob/living/simple_animal/hostile/bee,
	)),
))

GLOBAL_LIST_INIT(phobia_objs, list(
	"snakes" = typecacheof(list(
		/obj/item/rod_of_asclepius,
		/obj/item/toy/plush/snakeplushie,
	)),
	"spiders" = typecacheof(list(/obj/structure/spider)),
	"security" = typecacheof(list(
		/obj/effect/hallucination/simple/securitron,
		/obj/item/clothing/under/rank/security/detective,
		/obj/item/clothing/under/rank/security/head_of_security,
		/obj/item/clothing/under/rank/security/officer,
		/obj/item/clothing/under/rank/security/warden,
		/obj/item/gun/energy/taser,
		/obj/item/megaphone/sec,
		/obj/item/melee/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/stamp/hos,
		/obj/item/toy/figure/hos,
		/obj/item/toy/figure/secofficer,
		/obj/machinery/door/airlock/security,
		/obj/structure/statue/gold/hos,
		/obj/structure/statue/silver/sec,
		/obj/structure/statue/silver/secborg,
	)),

	"clowns" = typecacheof(list(
		/obj/item/bedsheet/clown,
		/obj/item/clothing/head/clownmitre,
		/obj/item/clothing/mask/gas/clown_hat,
		/obj/item/clothing/shoes/clown_shoes,
		/obj/item/clothing/suit/chaplainsuit/clownpriest,
		/obj/item/clothing/under/plasmaman/clown,
		/obj/item/clothing/under/rank/civilian/clown,
		/obj/item/food/cheesiehonkers,
		/obj/item/food/pie/cream,
		/obj/item/grown/bananapeel,
		/obj/item/gun/magic/staff/honk,
		/obj/item/instrument/bikehorn,
		/obj/item/megaphone/clown,
		/obj/item/modular_computer/tablet/pda/clown,
		/obj/item/pneumatic_cannon/pie,
		/obj/item/stack/ore/bananium,
		/obj/item/stack/tile/mineral/bananium,
		/obj/item/stamp/clown,
		/obj/item/storage/backpack/clown,
		/obj/item/storage/backpack/duffelbag/clown,
		/obj/item/storage/backpack/ert/clown,
		/obj/item/toy/crayon/rainbow,
		/obj/item/toy/mecha/darkhonk,
		/obj/item/toy/mecha/honk,
		/obj/item/trash/cheesie,
		/obj/machinery/door/airlock/bananium,
		/obj/structure/falsewall/bananium,
		/obj/structure/mecha_wreckage/honker,
		/obj/structure/statue/bananium,
		/obj/vehicle/sealed/car/clowncar,
		/obj/vehicle/sealed/mecha/combat/honker,
	)),

	"greytide" = (typecacheof(list(
		/obj/item/clothing/under/color/grey,
		/obj/item/melee/baton/security/cattleprod,
		/obj/item/spear,
		/obj/item/toy/figure/assistant,
		/obj/structure/statue/sandstone/assistant,
	)) + typecacheof(list(/obj/item/clothing/mask/gas), ignore_root_path = FALSE, only_root_path = TRUE // to match only specific items in this phobia and not subtypes, use an additional typecacheof w/ ignore_root_path set FALSE and only_root_patch set TRUE
	)),

	"lizards" = typecacheof(list(
		/obj/item/clothing/head/lizard,
		/obj/item/clothing/shoes/cowboy/lizard,
		/obj/item/food/kebab/tail,
		/obj/item/organ/external/tail/lizard,
		/obj/item/reagent_containers/food/drinks/bottle/lizardwine,
		/obj/item/toy/plush/lizard_plushie,
	)),

	"skeletons" = typecacheof(list(
		/obj/effect/decal/remains/human,
		/obj/item/clothing/suit/armor/bone,
		/obj/item/food/meat/slab/human/mutant/skeleton,
		/obj/item/organ/internal/tongue/bone,
		/obj/item/stack/sheet/bone,
	)),

	"conspiracies" = typecacheof(list(
		/obj/item/abductor/gizmo,
		/obj/item/abductor/silencer,
		/obj/item/clothing/head/helmet/abductor,
		/obj/item/clothing/suit/armor/abductor/vest,
		/obj/item/clothing/under/rank/captain,
		/obj/item/clothing/under/rank/captain/parade,
		/obj/item/clothing/under/rank/centcom/officer,
		/obj/item/clothing/under/rank/civilian/head_of_personnel,
		/obj/item/clothing/under/rank/engineering/chief_engineer,
		/obj/item/clothing/under/rank/medical/chief_medical_officer,
		/obj/item/clothing/under/rank/rnd/research_director,
		/obj/item/clothing/under/rank/rnd/research_director/alt,
		/obj/item/clothing/under/rank/rnd/research_director/turtleneck,
		/obj/item/clothing/under/rank/security/head_of_security,
		/obj/item/clothing/under/rank/security/head_of_security/alt,
		/obj/item/clothing/under/rank/security/head_of_security/grey,
		/obj/item/clothing/under/rank/security/head_of_security/parade,
		/obj/item/clothing/under/rank/security/head_of_security/parade/female,
		/obj/item/gun/energy/alien,
		/obj/item/megaphone/command,
		/obj/item/melee/baton/abductor,
		/obj/item/stamp/captain,
		/obj/item/stamp/ce,
		/obj/item/stamp/centcom,
		/obj/item/stamp/cmo,
		/obj/item/stamp/hop,
		/obj/item/stamp/hos,
		/obj/item/stamp/rd,
		/obj/item/storage/belt/military/abductor,
		/obj/item/toy/figure/captain,
		/obj/item/toy/figure/ce,
		/obj/item/toy/figure/cmo,
		/obj/item/toy/figure/dsquad,
		/obj/item/toy/figure/hop,
		/obj/item/toy/figure/hos,
		/obj/item/toy/figure/rd,
		/obj/item/toy/plush/abductor,
		/obj/item/toy/plush/abductor/agent,
		/obj/machinery/atmospherics/miner,
		/obj/machinery/door/airlock/centcom,
	)),

	"robots" = typecacheof(list(
		/obj/item/ai_module,
		/obj/item/aicard,
		/obj/item/toy/figure/borg,
		/obj/item/toy/talking/ai,
		/obj/machinery/computer/upload,
		/obj/machinery/recharge_station,
		/obj/structure/statue/diamond/ai1,
		/obj/structure/statue/diamond/ai2,
		/obj/structure/statue/silver/medborg,
		/obj/structure/statue/silver/secborg,
	)),

	"doctors" = typecacheof(list(
		/obj/item/cautery,
		/obj/item/circular_saw,
		/obj/item/clothing/head/plaguedoctorhat,
		/obj/item/clothing/mask/gas/plaguedoctor,
		/obj/item/clothing/suit/bio_suit/plaguedoctorsuit,
		/obj/item/clothing/under/rank/medical,
		/obj/item/healthanalyzer,
		/obj/item/hemostat,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/pill/,
		/obj/item/reagent_containers/syringe,
		/obj/item/retractor,
		/obj/item/scalpel,
		/obj/item/storage/medkit,
		/obj/item/storage/pill_bottle,
		/obj/item/surgical_drapes,
		/obj/item/surgicaldrill,
		/obj/machinery/atmospherics/components/unary/cryo_cell,
		/obj/machinery/dna_scannernew,
		/obj/machinery/door/airlock/medical,
		/obj/machinery/sleeper,
		/obj/machinery/stasis,
		/obj/structure/sign/departments/medbay,
	)),

	"authority" = typecacheof(list(
		/obj/item/card/id/advanced/centcom,
		/obj/item/card/id/advanced/gold,
		/obj/item/card/id/advanced/silver,
		/obj/item/clothing/under/rank/captain,
		/obj/item/clothing/under/rank/centcom/commander,
		/obj/item/clothing/under/rank/centcom/officer,
		/obj/item/clothing/under/rank/civilian/head_of_personnel,
		/obj/item/clothing/under/rank/engineering/chief_engineer,
		/obj/item/clothing/under/rank/medical/chief_medical_officer,
		/obj/item/clothing/under/rank/rnd/research_director,
		/obj/item/clothing/under/rank/security/head_of_security,
		/obj/item/megaphone/command,
		/obj/item/melee/baton/telescopic,
		/obj/item/stamp/captain,
		/obj/item/stamp/ce,
		/obj/item/stamp/centcom,
		/obj/item/stamp/cmo,
		/obj/item/stamp/hop,
		/obj/item/stamp/hos,
		/obj/item/stamp/rd,
		/obj/item/toy/figure/captain,
		/obj/item/toy/figure/ce,
		/obj/item/toy/figure/cmo,
		/obj/item/toy/figure/dsquad,
		/obj/item/toy/figure/hop,
		/obj/item/toy/figure/hos,
		/obj/item/toy/figure/rd,
		/obj/machinery/door/airlock/command,
		/obj/structure/statue/diamond/captain,
		/obj/structure/statue/gold/ce,
		/obj/structure/statue/gold/cmo,
		/obj/structure/statue/gold/hop,
		/obj/structure/statue/gold/hos,
		/obj/structure/statue/gold/rd,
	)),

	"the supernatural" = typecacheof(list(
		/obj/effect/rune,
		/obj/item/clothing/head/hooded/cult_hoodie,
		/obj/item/clothing/head/wizard,
		/obj/item/clothing/suit/hooded/cultrobes,
		/obj/item/clothing/suit/wizrobe,
		/obj/item/clothing/under/rank/civilian/chaplain,
		/obj/item/cult_bastard,
		/obj/item/gun/magic/staff,
		/obj/item/gun/magic/wand,
		/obj/item/melee/cultblade,
		/obj/item/necromantic_stone,
		/obj/item/nullrod,
		/obj/item/restraints/legcuffs/bola/cult,
		/obj/item/scrying,
		/obj/item/soulstone,
		/obj/item/spellbook,
		/obj/item/stack/sheet/hauntium,
		/obj/item/stack/sheet/runed_metal,
		/obj/item/staff,
		/obj/item/storage/toolbox/haunted,
		/obj/item/tome,
		/obj/item/toy/eightball/haunted,
		/obj/item/warp_whistle,
		/obj/machinery/door/airlock/cult,
		/obj/narsie,
		/obj/structure/destructible/cult,
		/obj/structure/spirit_board,
		/obj/item/toy/cards/deck/tarot,
	)),

	"aliens" = typecacheof(list(
		/obj/item/abductor,
		/obj/item/cautery/alien,
		/obj/item/circular_saw/alien,
		/obj/item/clothing/head/helmet/abductor,
		/obj/item/clothing/mask/facehugger,
		/obj/item/clothing/suit/armor/abductor,
		/obj/item/crowbar/abductor,
		/obj/item/gun/energy/alien,
		/obj/item/hemostat/alien,
		/obj/item/melee/baton/abductor,
		/obj/item/organ/internal/body_egg/alien_embryo,
		/obj/item/organ/internal/heart/gland,
		/obj/item/radio/headset/abductor,
		/obj/item/retractor/alien,
		/obj/item/scalpel/alien,
		/obj/item/screwdriver/abductor,
		/obj/item/stack/sheet/mineral/abductor,
		/obj/item/surgicaldrill/alien,
		/obj/item/toy/toy_xeno,
		/obj/item/toy/plush/abductor,
		/obj/item/toy/plush/abductor/agent,
		/obj/item/weldingtool/abductor,
		/obj/item/wirecutters/abductor,
		/obj/item/wrench/abductor,
		/obj/machinery/abductor,
		/obj/structure/alien,
		/obj/structure/bed/abductor,
		/obj/structure/closet/abductor,
		/obj/structure/statue/plasma/xeno,
		/obj/structure/table_frame/abductor,
		/obj/structure/table/abductor,
		/obj/structure/table/optable/abductor,
	)),

	"anime" = typecacheof(list(
		/obj/item/clothing/head/kitty/genuine,
		/obj/item/clothing/mask/gas/ninja,
		/obj/item/clothing/under/syndicate/ninja,
		/obj/item/clothing/under/costume/schoolgirl,
		/obj/item/energy_katana,
		/obj/item/food/chawanmushi,
		/obj/item/food/sashimi,
		/obj/item/highfrequencyblade,
		/obj/item/katana,
		/obj/item/nullrod/claymore/katana,
		/obj/item/nullrod/scythe/vibro,
		/obj/item/reagent_containers/food/drinks/bottle/sake,
		/obj/item/throwing_star,
		/obj/item/toy/katana,
		/obj/structure/mineral_door/paperframe,
		/obj/structure/window/paperframe,
	)),

	"birds" = typecacheof(list(
		/obj/item/clothing/head/chicken,
		/obj/item/clothing/head/griffin,
		/obj/item/clothing/head/helmet/space/freedom,
		/obj/item/clothing/mask/gas/owl_mask,
		/obj/item/clothing/mask/gas/plaguedoctor,
		/obj/item/clothing/shoes/griffin,
		/obj/item/clothing/suit/costume/chickensuit,
		/obj/item/clothing/suit/space/freedom,
		/obj/item/clothing/suit/toggle/owlwings,
		/obj/item/clothing/under/costume/griffin,
		/obj/item/clothing/under/costume/owl,
		/obj/item/food/cracker,
	)),

	"guns" = typecacheof(list(
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/gun/ballistic,
		/obj/item/gun/blastcannon,
		/obj/item/gun/chem,
		/obj/item/gun/energy,
		/obj/item/gun/grenadelauncher,
		/obj/item/gun/syringe,
		/obj/item/mecha_ammo,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy,
		/obj/item/storage/belt/bandolier,
		/obj/item/storage/belt/holster,
		/obj/machinery/porta_turret,
		/obj/machinery/power/emitter,
	)),

	"insects" = typecacheof(list(
		/obj/item/clothing/mask/animal/small/bee,
		/obj/item/clothing/suit/hooded/bee_costume,
		/obj/item/toy/plush/beeplushie,
		/obj/item/toy/plush/moth,
		/obj/structure/beebox,
	)),

	"blood" = typecacheof(list(
		/obj/effect/decal/cleanable/blood,
		/obj/item/reagent_containers/blood,
		/obj/item/reagent_containers/syringe,
		/obj/machinery/iv_drip,
	)),
))

GLOBAL_LIST_INIT(phobia_turfs, list(
	"space" = typecacheof(list(
		/turf/open/floor/fakespace,
		/turf/open/floor/holofloor/space,
		/turf/open/space,
	)),
	"the supernatural" = typecacheof(list(
		/turf/closed/wall/mineral/cult,
		/turf/open/floor/cult,
	)),
	"aliens" = typecacheof(list(
		/turf/closed/wall/mineral/abductor,
		/turf/open/floor/mineral/abductor,
		/turf/open/floor/plating/abductor,
		/turf/open/floor/plating/abductor2,
	)),
	"falling" = typecacheof(list(
		/turf/open/chasm,
		/turf/open/floor/fakepit,
		/turf/open/openspace,
	)),
))

GLOBAL_LIST_INIT(phobia_species, list(
	"aliens" = typecacheof(list(
		/datum/species/abductor,
		/datum/species/jelly,
		/datum/species/pod,
		/datum/species/shadow,
	)),
	"anime" = typecacheof(list(/datum/species/human/felinid)),
	"conspiracies" = typecacheof(list(
		/datum/species/abductor,
		/datum/species/lizard,
	)),
	"insects" = typecacheof(list(
		/datum/species/moth,
	)),
	"lizards" = typecacheof(list(/datum/species/lizard)),
	"robots" = typecacheof(list(/datum/species/android)),
	"skeletons" = typecacheof(list(
		/datum/species/plasmaman,
		/datum/species/skeleton,
	)),
	"the supernatural" = typecacheof(list(/datum/species/golem/runic)),
))

/// Creates a regular expression to match against the given phobia
/// Capture group 2 = the scary word
/// Capture group 3 = an optional suffix on the scary word
/proc/construct_phobia_regex(list/name)
	var/list/words = strings(PHOBIA_FILE, name)
	if(!length(words))
		CRASH("phobia [name] has no entries")
	var/words_match = ""
	for(var/word in words)
		words_match += "[REGEX_QUOTE(word)]|"
	words_match = copytext(words_match, 1, -1)
	return regex("(\\b|\\A)([words_match])('?s*)(\\b|\\|)", "ig")

#undef PHOBIA_FILE

/// A screenshot test for every humanoid species with a handful of jobs.
/datum/unit_test/screenshot_humanoids

/datum/unit_test/screenshot_humanoids/Run()
	// Test humans as their own thing so we can get more coverage on their features
	var/mob/living/carbon/human = allocate(/mob/living/carbon/human/dummy/consistent)
	human.set_species(/datum/species/human)
	human.equip_to_slot_if_possible(/datum/outfit/job/engineer)
	test_screenshot("[/datum/species/human]", get_flat_icon_for_all_directions(human))

	// The rest of the species
	for (var/datum/species/species_type as anything in subtypesof(/datum/species) - /datum/species/human)
		test_screenshot("[species_type]", get_flat_icon_for_all_directions(make_dummy(species_type, /datum/outfit/job/assistant/consistent)))

/datum/unit_test/screenshot_humanoids/proc/get_flat_icon_for_all_directions(atom/thing)
	var/icon/output = icon('icons/effects/effects.dmi', "nothing")
	COMPILE_OVERLAYS(thing)

	for (var/direction in GLOB.cardinals)
		var/icon/partial = getFlatIcon(thing, defdir = direction, no_anim = TRUE)
		output.Insert(partial, dir = direction)

	return output

/datum/unit_test/screenshot_humanoids/proc/make_dummy(species, job_outfit)
	var/mob/living/carbon/human/dummy/consistent/dummy = allocate(/mob/living/carbon/human/dummy/consistent)
	dummy.set_species(species)
	dummy.equipOutfit(job_outfit, visualsOnly = TRUE)
	return dummy

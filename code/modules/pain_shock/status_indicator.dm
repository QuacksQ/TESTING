#define PLANE_STATUS_INDICATOR -12 //Status Indicators that show over mobs' heads when certain things like stuns affect them.
#define STATUS_LAYER -2.1
#define STATUS_INDICATOR_Y_OFFSET 2 // Offset from the edge of the icon sprite, so 32 pixels plus whatever number is here.
#define STATUS_INDICATOR_ICON_X_SIZE 0 // Don't need to care about the Y size due to the origin being on the bottom side.
#define STATUS_INDICATOR_ICON_MARGIN 0 // The space between two status indicators. We don't do this with the current icons.
#define DEFAULT_MOB_SCALE 1

/datum/preference/toggle/enable_status_indicators
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "enable_status_indicators"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/enable_status_indicators/create_default_value()
	return TRUE

/datum/preference/toggle/enable_status_indicators/apply_to_client(client/client, value)
	if(client)
		var/mob/client_mob = client.mob
		INVOKE_ASYNC(client_mob, /mob.proc/apply_status_indicator_pref)

/mob/proc/apply_status_indicator_pref(datum/source)
	SIGNAL_HANDLER
	var/client/myclient = client
	var/value = myclient?.prefs?.read_preference(/datum/preference/toggle/enable_status_indicators)
	var/atom/movable/screen/plane_master/status/status_indicators  = locate() in myclient?.screen
	if(value && status_indicators)
		status_indicators.Show()
	else if(!value && status_indicators)
		status_indicators.Hide()

/mob/living
	var/list/status_indicators = null // Will become a list as needed. Contains our status indicator objects. Note, they are actually added to overlays, this just keeps track of what exists.

/// Returns true if the mob is weakened. Also known as floored.
/mob/living/proc/is_weakened()
	if(!indicator_fakeouts() && !HAS_TRAIT_FROM(src, TRAIT_FLOORED, BUCKLED_TRAIT) && !buckled && HAS_TRAIT(src, TRAIT_FLOORED) || has_status_effect(/datum/status_effect/incapacitating/knockdown))
		return TRUE

/// Returns true if the mob is stunned.
/mob/living/proc/is_stunned()
	if(!indicator_fakeouts() && HAS_TRAIT_FROM(src, TRAIT_INCAPACITATED, TRAIT_STATUS_EFFECT(STAT_TRAIT)) || HAS_TRAIT(src, TRAIT_CRITICAL_CONDITION) || HAS_TRAIT_FROM(src, TRAIT_IMMOBILIZED, TRAIT_STATUS_EFFECT(STAT_TRAIT)) || HAS_TRAIT_FROM(src, TRAIT_IMMOBILIZED, CHOKEHOLD_TRAIT)  || HAS_TRAIT_FROM(src, TRAIT_INCAPACITATED, TRAIT_STATUS_EFFECT(STAT_TRAIT)) || HAS_TRAIT_FROM(src, TRAIT_IMMOBILIZED, TRAIT_STATUS_EFFECT(STAT_TRAIT)))
		return TRUE

/// Returns true if the mob is paralyzed - for can't fight back purposes.
/mob/living/proc/is_paralyzed()
	if(!indicator_fakeouts() && HAS_TRAIT_FROM(src, TRAIT_FLOORED, CHOKEHOLD_TRAIT) || HAS_TRAIT_FROM(src, TRAIT_IMMOBILIZED, TRAIT_STATUS_EFFECT(STAT_TRAIT)) || HAS_TRAIT(src, TRAIT_CRITICAL_CONDITION)  || HAS_TRAIT_FROM(src, TRAIT_INCAPACITATED, STAMINA))
		return TRUE

/// Returns true if the mob is unconcious for any reason.
/mob/living/proc/is_unconcious()
	if(!indicator_fakeouts() && HAS_TRAIT(src, TRAIT_KNOCKEDOUT))
		return TRUE

/// Returns true if the mob has confusion.
/mob/living/proc/is_confused()
	if(!indicator_fakeouts() && has_status_effect(/datum/status_effect/confusion))
		return TRUE

/mob/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_MOB_CLIENT_LOGIN, .proc/apply_status_indicator_pref)

/mob/living/carbon/Initialize(mapload)
	. = ..()
	// The Basics
	RegisterSignal(src, COMSIG_LIVING_DEATH, .proc/cut_indicators_overlays)
	RegisterSignal(src, COMSIG_CARBON_HEALTH_UPDATE, .proc/status_indicator_evaluate)
	RegisterSignal(src, COMSIG_LIVING_LIFE, .proc/check_indicators)
	// When things actually happen
	RegisterSignal(src, COMSIG_LIVING_STATUS_STUN, .proc/stunned_indicator_update)
	RegisterSignal(src, COMSIG_LIVING_STATUS_KNOCKDOWN, .proc/weaken_indicator_update)
	RegisterSignal(src, COMSIG_LIVING_STATUS_PARALYZE, .proc/paralyzed_indicator_update)
	RegisterSignal(src, COMSIG_LIVING_STATUS_IMMOBILIZE, .proc/status_indicator_evaluate)
	RegisterSignal(src, COMSIG_LIVING_STATUS_UNCONSCIOUS, .proc/unconcious_indicator_update)

/// This proc makes it so that mobs that have status indicators are checked to remove them, especially in fakeout situations.
/mob/living/proc/check_indicators()
	if(status_indicators)
		status_indicator_evaluate()

/// Receives signals to update on carbon health updates. Checks if the mob is dead - if true, removes all the indicators. Then, we determine what status indicators the mob should carry or remove.
/mob/living/proc/status_indicator_evaluate()
	SIGNAL_HANDLER
	if(stat == DEAD)
		return
	else
		weaken_indicator_update()
		paralyzed_indicator_update()
		stunned_indicator_update()
		unconcious_indicator_update()
		confused_indicator_update()
		return
/// Cases in which no status indicators should appear above a mob, such as changeling revive and regen coma.
/mob/living/proc/indicator_fakeouts()
	if(HAS_TRAIT(src, TRAIT_DEATHCOMA))
		return TRUE
	return FALSE

/mob/living/proc/weaken_indicator_update()
	SIGNAL_HANDLER
	is_weakened() ? add_status_indicator(WEAKEN) : remove_status_indicator(WEAKEN)
/mob/living/proc/paralyzed_indicator_update()
	SIGNAL_HANDLER
	is_paralyzed() ? add_status_indicator(PARALYSIS) : remove_status_indicator(PARALYSIS)
/mob/living/proc/stunned_indicator_update()
	SIGNAL_HANDLER
	is_stunned() ? add_status_indicator(STUNNED) : remove_status_indicator(STUNNED)
/mob/living/proc/unconcious_indicator_update()
	SIGNAL_HANDLER
	is_unconcious() ? add_status_indicator(SLEEPING) : remove_status_indicator(SLEEPING)
/mob/living/proc/confused_indicator_update()
	SIGNAL_HANDLER
	is_confused() ? add_status_indicator(CONFUSED) : remove_status_indicator(CONFUSED)

/// Adds a status indicator to the mob. Takes an image as an argument. If it exists, it won't dupe it.
/mob/living/proc/add_status_indicator(image/prospective_indicator)
	if(get_status_indicator(prospective_indicator)) // No duplicates, please.
		return

	prospective_indicator = image(icon = 'icons/mob/status_indicators.dmi', loc = src, icon_state = prospective_indicator)

	LAZYADD(status_indicators, prospective_indicator)
	handle_status_indicators()

/// Similar to add_status_indicator() but removes it instead, and nulls the list if it becomes empty as a result.
/mob/living/proc/remove_status_indicator(image/prospective_indicator)
	prospective_indicator = get_status_indicator(prospective_indicator)

	cut_overlay(prospective_indicator)
	LAZYREMOVE(status_indicators, prospective_indicator)
	handle_status_indicators()

/// Finds a status indicator on a mob.
/mob/living/proc/get_status_indicator(image/prospective_indicator)

	for(var/image/indicator in status_indicators)
		if(indicator.icon_state == prospective_indicator)
			return indicator
	return LAZYACCESS(status_indicators, LAZYFIND(status_indicators, prospective_indicator))

/// Cuts all the indicators on a mob in a loop.
/mob/living/proc/cut_indicators_overlays()
	SIGNAL_HANDLER
	for(var/prospective_indicator in status_indicators)
		cut_overlay(prospective_indicator)

/// Refreshes the indicators over a mob's head. Should only be called when adding or removing a status indicator with the above procs,
/// or when the mob changes size visually for some reason.
/mob/living/proc/handle_status_indicators()
	// First, get rid of all the overlays.
	cut_indicators_overlays()

	if(!LAZYLEN(status_indicators))
		return

	if(stat == DEAD)
		return
	var/mob/living/carbon/my_carbon_mob = src
	var/icon_scale = get_icon_scale(my_carbon_mob)
	// Now put them back on in the right spot.
	var/our_sprite_x = 16 * icon_scale
	var/our_sprite_y = 24 * icon_scale

	var/x_offset = our_sprite_x // Add your own offset here later if you want.
	var/y_offset = our_sprite_y + STATUS_INDICATOR_Y_OFFSET

	// Calculates how 'long' the row of indicators and the margin between them should be.
	// The goal is to have the center of that row be horizontally aligned with the sprite's center.
	var/expected_status_indicator_length = (STATUS_INDICATOR_ICON_X_SIZE * status_indicators.len) + (STATUS_INDICATOR_ICON_MARGIN * max(status_indicators.len - 1, 0))
	var/current_x_position = (x_offset / 2) - (expected_status_indicator_length / 2)

	// In /mob/living's `update_transform()`, the sprite is horizontally shifted when scaled up, so that the center of the sprite doesn't move to the right.
	// Because of that, this adjustment needs to happen with the future indicator row as well, or it will look bad.
	current_x_position -= 16 * (icon_scale - DEFAULT_MOB_SCALE)

	// Now the indicator row can actually be built.
	for(var/prospective_indicator in status_indicators)
		var/image/indicator = prospective_indicator

		// This is a semi-HUD element, in a similar manner as medHUDs, in that they're 'above' everything else in the world,
		// but don't pierce obfuscation layers such as blindness or darkness, unlike actual HUD elements like inventory slots.
		indicator.plane = PLANE_STATUS_INDICATOR
		indicator.layer = STATUS_LAYER
		indicator.appearance_flags = PIXEL_SCALE|TILE_BOUND|NO_CLIENT_COLOR|RESET_COLOR|RESET_ALPHA|RESET_TRANSFORM|KEEP_APART
		indicator.pixel_y = y_offset
		indicator.pixel_x = current_x_position
		add_overlay(indicator)
		// Adding the margin space every time saves a conditional check on the last iteration,
		// and it won't cause any issues since no more icons will be added, and the var is not used for anything else.
		current_x_position += STATUS_INDICATOR_ICON_X_SIZE + STATUS_INDICATOR_ICON_MARGIN

/mob/living/proc/get_icon_scale(livingmob)
	if(!iscarbon(livingmob)) // normal mobs are always 1 for scale - hopefully all borgs and simplemobs get this one
		return DEFAULT_MOB_SCALE
	var/mysize = (DEFAULT_MOB_SCALE)
	return mysize

/atom/movable/screen/plane_master/status
	name = "status indicator plane master"
	plane = PLANE_STATUS_INDICATOR
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY
	render_relay_plane = RENDER_PLANE_NON_GAME

#undef STATUS_INDICATOR_Y_OFFSET
#undef STATUS_INDICATOR_ICON_X_SIZE
#undef STATUS_INDICATOR_ICON_MARGIN


import json

damage_types = ['melee', 'ranged', 'fire', 'ice', 'electric', 'light', 'arcane', 'dark', 'kinetic', 'chemical']
damage_methods = ['attack', 'combo', 'explosion', 'volume']

def generate_file(type, method):
    json_dict = {'exhaustion':0.0, 'scaling':'never', 'death_message_type':'default'}
    fp = open(f'cga_{type}_{method}.json', 'w')
    # message_id
    if method == 'explosion' or method == 'volume':
        json_dict['message_id'] = 'player_explosion'
    elif type == 'melee' or type == 'ice' or type == 'electric' or type == 'chemical':
        json_dict['message_id'] = 'player_attack'
    elif type == 'ranged':
        json_dict['message_id'] = 'arrow'
    elif type == 'fire':
        json_dict['message_id'] = 'on_fire'
    elif type == 'light' or type == 'arcane' or type == 'dark':
        json_dict['message_id'] = 'indirect_magic'
    elif type == 'kinetic':
        json_dict['message_id'] = 'thrown'
    # effect
    if type == 'melee' or type == 'ranged' or type == 'electric' or type == 'light' or type == 'arcane' or type == 'dark' or type == 'kinetic':
        json_dict['effects'] = 'hurt'
    elif type == 'fire' or type == 'chemical':
        json_dict['effects'] = 'burning'
    elif type == 'ice':
        json_dict['effects'] = 'freezing'
    # generate file
    json.dump(json_dict, fp, indent='\t', sort_keys=True)
    
for type in damage_types:
    for method in damage_methods:
        generate_file(type, method)

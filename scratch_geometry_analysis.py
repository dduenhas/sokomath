import re, collections

# Parse level_data.gd to extract all level functions and their static data
with open('novo-projeto-de-jogo/scripts/level_data.gd', 'r', encoding='utf-8') as f:
    content = f.read()

# Let's inspect each level function
level_func_pattern = re.compile(r'static func (_level_g\d_\d)\(\) -> Dictionary:(.*?)(?=\nstatic func |\Z)', re.DOTALL)
levels = level_func_pattern.findall(content)

print(f"Extracted {len(levels)} levels.")
for name, body in levels:
    # check grid_width, grid_height, player_start, door_pos, walls, crates, plates
    gw = int(re.search(r'"grid_width":\s*(\d+)', body).group(1))
    gh = int(re.search(r'"grid_height":\s*(\d+)', body).group(1))
    ps_m = re.search(r'"player_start":\s*Vector2i\((\d+),\s*(\d+)\)', body)
    player_start = (int(ps_m.group(1)), int(ps_m.group(2))) if ps_m else None
    
    # check interior walls (not on border x=0, x=gw-1, y=0, y=gh-1)
    walls = [tuple(map(int, m)) for m in re.findall(r'Vector2i\((\d+),\s*(\d+)\)', body[body.find('"walls"'):body.find('"crates"')])]
    interior_walls = [w for w in walls if 0 < w[0] < gw - 1 and 0 < w[1] < gh - 1]
    
    # find initial crate positions
    crate_matches = re.findall(r'"pos":\s*Vector2i\((\d+),\s*(\d+)\)', body[body.find('"crates"'):body.find('"plates"')])
    crates = [tuple(map(int, c)) for c in crate_matches]
    
    # find plate positions
    plate_matches = re.findall(r'"pos":\s*Vector2i\((\d+),\s*(\d+)\)', body[body.find('"plates"'):])
    plates = [tuple(map(int, p)) for p in plate_matches]
    
    print(f"\n[{name}] Grid: {gw}x{gh}, Player: {player_start}")
    print(f"  Interior walls ({len(interior_walls)}): {interior_walls}")
    print(f"  Crates ({len(crates)}): {crates}")
    print(f"  Plates ({len(plates)}): {plates}")

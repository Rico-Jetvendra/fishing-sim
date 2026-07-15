<?php
    return [
        'menu' => [
            [
                'label'         => 'Dashboard',
                'route'         => 'web.index',
                'icon'          => 'bi-speedometer2',
            ],
            [
                'label'         => 'Master',
                'icon'          => 'bi-folder',
                'children' => [
                    ['label' => 'Bait', 'route' => 'web.bait.index'],
                    ['label' => 'City', 'route' => 'web.city.index'],
                    ['label' => 'Rod', 'route' => 'web.rod.index'],
                    ['label' => 'Location', 'route' => 'web.location.index'],
                    ['label' => 'Mutation', 'route' => 'web.mutation.index'],
                    ['label' => 'Weather', 'route' => 'web.weather.index'],
                    ['label' => 'Fish', 'route' => 'web.fish.index'],
                    ['label' => 'Fish Type', 'route' => 'web.fishType.index'],
                ]
            ],
            [
                'label'         => 'Relation',
                'icon'          => 'bi-link',
                'children' => [
                    ['label' => 'Fish Bait', 'route' => 'web.fishBait.index'],
                    ['label' => 'Fish Location', 'route' => 'web.fishLocation.index'],
                    ['label' => 'Fish Rod', 'route' => 'web.fishRod.index'],
                    ['label' => 'Fish Season', 'route' => 'web.fishSeason.index'],
                    ['label' => 'Fish Weather', 'route' => 'web.fishWeather.index'],
                ]
            ],
            [
                'label'         => 'Activity',
                'icon'          => 'bi-clock-history',
                'children' => [
                    ['label' => 'Catch Logs', 'route' => 'web.catchLogs.index'],
                ]
            ],
        ],
        'water' => [
            (object)[
                'water_type'        => 1,
                'water_type_name'   => "Freshwater"
            ],
            (object)[
                'water_type'        => 2,
                'water_type_name'   => "Brackish"
            ],
            (object)[
                'water_type'        => 3,
                'water_type_name'   => "Seawater"
            ]
        ],
        'bait_category' => [
            (object)[
                'bait_category'        => 1,
                'bait_category_name'   => "Worm"
            ],
            (object)[
                'bait_category'        => 2,
                'bait_category_name'   => "Crustacean"
            ],
            (object)[
                'bait_category'        => 3,
                'bait_category_name'   => "Larvae"
            ],
            (object)[
                'bait_category'        => 4,
                'bait_category_name'   => "Insect"
            ],
            (object)[
                'bait_category'        => 5,
                'bait_category_name'   => "Mollusk"
            ],
            (object)[
                'bait_category'        => 6,
                'bait_category_name'   => "Fish"
            ],
            (object)[
                'bait_category'        => 7,
                'bait_category_name'   => "Meat"
            ],
            (object)[
                'bait_category'        => 8,
                'bait_category_name'   => "Produce"
            ],
            (object)[
                'bait_category'        => 9,
                'bait_category_name'   => "Cephalopods"
            ],
        ],
        'rod_rarity' => [
            (object)[
                'rod_rarity'        => 1,
                'rod_rarity_name'   => "Basic"
            ],
            (object)[
                'rod_rarity'        => 2,
                'rod_rarity_name'   => "Intermediate"
            ],
            (object)[
                'rod_rarity'        => 3,
                'rod_rarity_name'   => "Advanced"
            ],
            (object)[
                'rod_rarity'        => 4,
                'rod_rarity_name'   => "Legendary"
            ]
        ],
        'banned_words' => [
            'fuck',
            'fucking',
            'fucker',
            'motherfucker',
            'shit',
            'shitty',
            'bullshit',
            'bitch',
            'bastard',
            'asshole',
            'dick',
            'penis',
            'vagina',
            'pussy',
            'cunt',
            'whore',
            'slut',
            'damn',
            'goddamn',
            'blowjob',
            'handjob',
            'anal',
            'cum',
            'cumming',
            'orgasm',
            'masturbate',
            'porn',
            'pornhub',
            'hentai',
            'nsfw',
            'onlyfans',
            'milf',
            'bdsm',
            'incest',
            'gangbang',
            'kys',
            'kill yourself',
            'suicide',
            'self harm',
            'hang yourself',
            'cut yourself',
            'overdose',
            'free followers',
            'buy followers',
            'buy viewers',
            'cheap viewers',
            'cheap followers',
            'bitcoin giveaway',
            'crypto giveaway',
            'http://',
            'https://',
            'www.',
            'best viewers',
            'cheap viewers',
            'buy viewers',
            'buy followers',
            'promotion',
            'grow your channel',
            'viewers on',
            'viewer.shop',
        ],
    ];
?>

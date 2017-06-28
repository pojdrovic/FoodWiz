//
//  IngredientsViewController.swift
//  FoodWiz
//
//  Created by Petar Ojdrovic on 5/16/17.
//  Copyright © 2017 Petar Ojdrovic. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchIngsButton: UIButton!
    
    var arrayOfIngredients: [Int] = []
    var arrayOfStringIngredients: [String] = []
    
    
    var deleteIngredientIndexPath: NSIndexPath? = nil
    
            var dictOfIngredients:[String:Int] = ["Parmesan": 695, "Filo pastry": 368, "Pak choi": 684, "Chapatis": 172, "Gurnard": 462, "Beurre mani\u{00c3}\u{00a9}": 68, "Monk's beard": 630, "Balsamic vinegar": 41, "Passion fruit": 700, "Pie": 731, "Pig cheeks": 732, "Macaroni": 573, "Smoked salmon": 922, "Shortcrust pastry": 910, "Raisins": 806, "Sesame seeds": 900, "Pigeon peas": 734, "Plantain": 748, "Nibbed almonds": 656, "Mace": 575, "Dried cherries": 332, "Chicken wing": 194, "Baked beans": 38, "Salad": 865, "Hogget": 481, "Coffee": 244, "Jerusalem artichoke": 505, "Bulgur wheat": 126, "Mesclun": 609, "King Edward": 516, "Boar": 89, "Sweet potato": 979, "Pheasant": 727, "Mirepoix": 620, "Strawberry": 962, "Egg yolk": 348, "Egg wash": 346, "Dijon mustard": 323, "Cornflour": 264, "Blueberry": 88, "Lamb kidney": 527, "Oatcakes": 663, "Grapefruit": 441, "Buttermilk": 133, "Dolcelatte": 326, "Vacherin": 1035, "Cr\u{00c3}\u{00aa}pe": 285, "Pike": 735, "Thai basil": 1009, "Meringue": 608, "Brioche": 112, "Tamarillo": 994, "Chicken soup": 191, "Wholegrain mustard": 1080, "Pizza": 745, "Pasty": 705, "Wild mushrooms": 1085, "Carrageen moss": 151, "Chopped tomatoes": 216, "Lemon curd": 547, "Curry leaves": 305, "Grapes": 443, "Spaghetti": 939, "Redcurrant jelly": 824, "Scotch bonnet chilli": 886, "Yam": 1092, "Margarine": 591, "Sushi rice": 977, "Mutton": 648, "Rose wine": 851, "Carrot": 153, "Ginger ale": 423, "Sichuan pepper": 911, "Brill": 111, "Watermelon": 1059, "Pork loin": 765, "Coriander": 258, "Blood orange": 87, "Mackerel": 576, "Red lentil": 816, "Savory": 883, "Date": 317, "Cress": 286, "Almond essence": 10, "Soda bread": 927, "Rainbow trout": 805, "Fruit salad": 407, "Barley": 47, "Lamb": 523, "Gammon": 412, "Quinoa": 799, "Beef dripping": 57, "Lettuce": 553, "Fortified wine": 392, "Cinnamon": 226, "Single cream": 913, "Rennet": 825, "Falafel": 357, "Red wine": 821, "Stew": 957, "Fillet of beef": 367, "Sambuca": 875, "Halloumi": 468, "Cauliflower": 159, "Cheese": 178, "Citrus fruit": 227, "Preserved lemons": 780, "Buns": 127, "Coulis": 267, "Chocolate truffle": 215, "Lancashire": 535, "Croissant": 289, "Soya beans": 935, "Corn syrup": 262, "Sardine": 877, "Pickled onion": 730, "Fennel seeds": 361, "Japanese pumpkin": 501, "Gorgonzola": 437, "Lamb rump": 531, "Sea bass": 888, "Escalope": 354, "Wensleydale": 1062, "Stem ginger": 956, "Brown shrimp": 121, "Fudge": 408, "Asafoetida": 31, "Shortbread": 909, "Gooseberry": 436, "Cake": 137, "Brown sugar": 122, "Self-raising flour": 896, "Aubergine": 33, "Crudit\u{00c3}\u{00a9}s": 292, "Clams": 228, "Sweetbread": 981, "Pea shoots": 708, "Kiwi fruit": 519, "Bread": 103, "Fettuccine": 364, "Ras-el-hanout": 809, "Nutmeg": 662, "Caramel": 147, "Pomegranate": 753, "Pomegranate juice": 754, "Rice vinegar": 832, "Chilli con carne": 199, "Argan oil": 28, "Lamb chop": 525, "Popcorn": 757, "Ice cream": 493, "Mascarpone": 599, "Tangerine": 996, "Vermouth": 1048, "Vegetable stock": 1042, "Borage": 92, "Bran": 97, "White wine vinegar": 1075, "Yeast": 1093, "Cape gooseberries": 144, "Cherry": 180, "Quark": 796, "Gouda": 438, "Sea bream": 889, "Breadfruit": 107, "Vegetable oil": 1040, "Vinegar": 1050, "Swiss rolls and roulades": 984, "Pecan": 716, "Chocolate brownies": 212, "Clementine": 230, "Mixed nuts": 626, "Rack of lamb": 801, "Dulce de leche": 340, "Campagne loaf": 141, "January King cabbage": 500, "Cheshire": 184, "Noodles": 658, "Squash": 951, "Coffee liqueur": 248, "Onion": 673, "White pepper": 1073, "Ghee": 418, "Acorn squash": 2, "Smoked cheese": 918, "Poussin": 776, "Potato wedges": 774, "Oxtail": 679, "Emmental": 351, "Fennel": 360, "Quail": 794, "Lingonberry": 560, "White bread": 1069, "Evaporated milk": 355, "Tapioca": 998, "Seeds": 895, "Rigatoni": 835, "Frankfurter": 395, "Lamb shank": 532, "Sausage": 882, "Mustard seeds": 647, "Flatbread": 378, "Rabbit": 800, "Currant bread": 302, "Coffee beans": 245, "Rice pudding": 831, "Chicory": 197, "Asparagus": 32, "Wild duck": 1083, "Polenta": 750, "Tapenade": 997, "Cognac": 249, "Vine leaves": 1049, "Mung beans": 639, "Arbroath smokie": 27, "Crab": 271, "Brown lentil": 118, "Potato": 772, "Summer cabbage": 973, "Pigeon": 733, "Anchovies": 15, "Paw-paw": 707, "Pork belly": 761, "Acidulated water": 0, "Butter beans": 130, "Fish": 369, "Basil": 48, "Dumplings": 341, "Meat": 603, "B\u{00c3}\u{00a9}chamel sauce": 54, "Scallop": 885, "Fontina cheese": 389, "Salmon": 869, "Soya flour": 936, "Salt": 872, "Icing": 495, "Chicken breast": 188, "Cod": 242, "Turmeric": 1032, "Spinach": 945, "Seville orange": 901, "Rainbow chard": 804, "Dried mixed fruit": 335, "Sorrel": 930, "Samphire": 876, "Damsons": 313, "Vodka": 1051, "Brandy": 98, "Whitecurrant": 1077, "Whisky liqueur": 1068, "Cream cheese": 279, "Veal": 1039, "New potatoes": 655, "Cucumber": 295, "Oats": 665, "Marrow": 594, "Salsify": 871, "Parsley": 696, "Edam": 343, "Star anise": 953, "Fondant potatoes": 388, "Banana": 43, "Flank": 376, "Tahini": 991, "Lovage": 570, "Blini": 86, "Shiitake mushroom": 907, "Haddock": 464, "Dried fruit": 334, "Porcini": 759, "Red Leicester": 815, "Sesame oil": 899, "Red rice": 819, "Terrine": 1008, "Celeriac": 164, "Pecorino": 717, "Pancakes": 686, "Coconut cream": 239, "Lemon": 545, "Whisky": 1066, "Perch": 724, "Radicchio": 802, "Pomelo": 756, "Prune juice": 784, "Rock salmon": 845, "Candied peel": 142, "Cheddar": 177, "Icing sugar": 496, "Fromage frais": 402, "Butterhead lettuce": 132, "Tinned tuna": 1012, "Orange juice": 675, "Curd cheese": 300, "Sweetcorn": 982, "Cranberry": 274, "Walnut": 1054, "Muesli": 635, "Whiting": 1078, "Corned beef": 263, "Prawn": 778, "Unleavened bread": 1034, "Apple": 20, "Coconut oil": 241, "Chives": 209, "Heart": 475, "Hoki": 483, "Brie": 110, "Curacao": 298, "Coleslaw": 251, "Shellfish": 904, "Dab": 311, "Dandelion": 314, "Chump": 222, "Tomato pur\u{00c3}\u{00a9}e": 1018, "Blackberry": 83, "Pearl barley": 714, "Bagel": 36, "Tripe": 1023, "Venison": 1045, "Game": 411, "Truffle oil": 1026, "Lemonade": 550, "Olive": 671, "Blackcurrant": 84, "Pumpernickel bread": 789, "Coffee essence": 246, "Spelt": 942, "Tartare sauce": 1001, "Crumble": 293, "Black pepper": 78, "Verjus": 1046, "Anise": 19, "Blackcurrant juice drink": 85, "Arrowroot": 29, "Oyster mushrooms": 681, "Maple syrup": 590, "Cumberland sauce": 296, "Agar-agar": 5, "Confectionery": 257, "Ginger beer": 424, "Kidney beans": 515, "Smoked fish": 919, "Arborio rice": 26, "Aduki beans": 3, "Dragon fruit": 330, "Coley": 252, "Baking": 39, "Roast chicken": 839, "Chinese mushrooms": 205, "Miso": 622, "Brisket": 113, "Flageolet beans": 374, "Olive oil": 672, "Tonic": 1020, "Apricot": 24, "Bratwurst": 101, "Barbecue sauce": 46, "Crab apple": 272, "Comt\u{00c3}\u{00a9}": 255, "Mortadella": 633, "Beer": 64, "Apple juice": 22, "Kale": 511, "Catfish": 157, "Naan bread": 649, "White cabbage": 1070, "Bicarbonate of soda": 69, "Grain": 439, "Green cabbage": 450, "Peanuts": 712, "Salami": 868, "Honeycomb": 487, "Redcurrant": 823, "Plain flour": 747, "Pastrami": 703, "Chicken liver": 190, "Chard": 174, "Chilli": 198, "Madeira cake": 578, "Leg of lamb": 544, "Ratafia biscuits": 812, "Fish soup": 372, "Hot cross buns": 490, "Wholemeal flour": 1082, "Rib of beef": 827, "Pork shoulder": 768, "Rhubarb": 826, "Desir\u{00c3}\u{00a9}e": 321, "Flapjacks": 377, "Ginger": 422, "Demi-glace sauce": 319, "Lamb stock": 534, "Dried apricots": 331, "Amaranth": 13, "Bread roll": 104, "Mince pies": 616, "Cranberry juice": 275, "Ling": 559, "Haggis": 465, "Beef stock": 62, "Cro\u{00c3}\u{00bb}tons": 291, "Lime cordial": 555, "Worcestershire sauce": 1090, "Plum": 749, "Fruit": 403, "Rye bread": 860, "Flying fish": 384, "Floury potato": 383, "Garlic": 414, "Mushroom": 640, "Tabasco": 988, "Topside": 1021, "Blachan": 74, "Tomato": 1015, "Hake": 466, "Coriander seeds": 260, "Court bouillon": 269, "Salsa": 870, "Snapper": 924, "Grapeseed oil": 444, "Zest": 1097, "Pork sausages": 767, "Angostura bitters": 18, "Steak": 955, "Pastry": 704, "Jerk seasoning": 503, "Haba\u{00c3}\u{00b1}ero chillies": 463, "Tomato chutney": 1016, "Serrano ham": 898, "Panettone": 690, "Five-spice powder": 373, "Oyster sauce": 682, "Beef": 55, "Lasagne": 539, "Flaked almonds": 375, "Sponge cake": 947, "French dressing": 399, "Herbal liqueur": 476, "Bamboo shoots": 42, "Lamb shoulder": 533, "Ciabatta": 224, "Hollandaise sauce": 484, "Red onion": 818, "Lamb mince": 529, "Rosewater": 854, "Anchovy essence": 16, "Mint": 618, "Halibut": 467, "Long-grain rice": 569, "Dill": 324, "Laverbread": 541, "Walnut oil": 1055, "Turkey breast": 1029, "Mincemeat": 617, "Chapati flour": 171, "Couscous": 270, "Mangetout": 584, "Piccalilli": 728, "Lychee": 571, "Summer fruit": 974, "Wine": 1087, "Bonito": 91, "Mixed spices": 628, "Wild rice": 1086, "Juniper berries": 508, "Pork": 760, "Prawn crackers": 779, "Smoked mackerel": 921, "Loganberry": 568, "Bouquet garni": 94, "Dry sherry": 336, "Lamb fillet": 526, "Kumquat": 521, "Millet flour": 614, "Stilton": 959, "Whitebait": 1076, "Gratin": 445, "Vegetarian sausage": 1044, "Lager": 522, "Crispbread": 287, "Giblets": 420, "Muffins": 636, "Sea salt": 890, "Rosehip syrup": 852, "Paella": 683, "Pork chop": 762, "Banana bread": 44, "Pollack": 751, "Roast turkey": 843, "Tofu": 1014, "Butternut squash": 134, "Capsicum": 146, "Fish roe": 370, "Mirin": 621, "Tagliatelle": 990, "Baguette": 37, "Liver": 565, "Caul fat": 158, "Exotic fruit": 356, "Freekeh": 396, "Hummus": 491, "Broad beans": 114, "Roast potatoes": 842, "Lemon sole": 549, "Swiss chard": 983, "Okra": 670, "Seasoning": 893, "Lobster": 567, "Cream": 278, "Cuttlefish": 310, "Herbal tea": 477, "Cardamom": 149, "Paprika": 693, "Offal": 667, "Rice noodles": 830, "Rouille": 855, "Peel": 719, "Safflower oil": 862, "Nectarine": 653, "Root vegetable": 849, "Royal icing": 856, "Custard powder": 309, "Ketchup": 512, "Fruit juice": 406, "Cod roe": 243, "Red cabbage": 814, "Crayfish": 277, "Pork mince": 766, "Madeleines": 579, "Condensed milk": 256, "Cheese sauce": 179, "Macaroon": 574, "Blackbean sauce": 82, "Rosemary": 853, "Guava": 460, "Cocoa powder": 237, "Pinto beans": 741, "Gin": 421, "Syrup": 986, "Sugar-snap peas": 970, "Hare": 470, "Almond": 9, "Turkish delight": 1031, "Green banana": 448, "Wholemeal bread": 1081, "Sucralose": 967, "Sultanas": 971, "Sunflower seed": 976, "Fruit brandy": 404, "Sourdough bread": 932, "Pesto": 726, "Cannellini beans": 143, "Skate": 915, "Farfalle": 358, "Stewing lamb": 958, "Curry": 304, "Fenugreek": 362, "Bay boletes": 50, "Rum": 857, "Hunza apricots": 492, "Chinese pancake": 206, "Taro": 999, "Vermicelli": 1047, "Sharon fruit": 903, "Prune": 783, "Lime leaves": 557, "Double Gloucester": 328, "Raita": 807, "Coconut": 238, "Raspberry jam": 811, "Nasturtium": 652, "Vanilla essence": 1036, "Beef rump": 60, "Hoisin sauce": 482, "Pine nut": 736, "Milk": 610, "Ackee": 1, "Pomegranate molasses": 755, "Roast lamb": 840, "Chickpea flour": 196, "Silverside": 912, "Medlars": 604, "Focaccia": 385, "Spring roll wrappers": 950, "Chervil": 183, "Lamb loin": 528, "Rapeseed oil": 808, "Bacon": 35, "Black bream": 76, "Horseradish sauce": 489, "Marshmallow": 597, "Perry": 725, "Truffle": 1025, "Ketjap manis": 513, "Bresaola": 109, "Braising steak": 95, "Black pudding": 79, "Cocktail": 235, "Peanut oil": 711, "Biscotti": 72, "Buttercream icing": 131, "Chestnut mushrooms": 186, "Gravy": 446, "Chorizo": 217, "Whelk": 1064, "Fruit cake": 405, "Duck": 337, "Jus": 509, "Winkles": 1088, "Flour tortilla": 382, "Green tea": 452, "Pistachio": 743, "Feta": 363, "Chocolate": 210, "Cayenne pepper": 163, "Basmati rice": 49, "Cottage cheese": 266, "Spices": 944, "Pandan leaves": 688, "Liquorice": 563, "Dim sum wrappers": 325, "Crisps": 288, "Chantilly cream": 170, "Berry": 66, "Spaghetti squash": 940, "Goats' cheese": 431, "Molasses": 629, "Purple sprouting broccoli": 792, "Daikon": 312, "Brandy butter": 99, "Borlotti beans": 93, "Chilli paste": 201, "Matzo": 601, "Toffee": 1013, "Beansprouts": 53, "Morel": 632, "Herring": 480, "Radish": 803, "Roasted vegetables": 844, "Horseradish": 488, "Rice flour": 829, "Black eyed beans": 77, "Brandy snaps": 100, "Stuffing": 966, "Soda": 926, "Glucose": 429, "Vegetable shortening": 1041, "Raspberry": 810, "Alfalfa sprouts": 7, "Chayote": 176, "Red snapper": 820, "Marsala wine": 596, "Peach": 709, "Palm sugar": 685, "Nachos": 650, "Herbes de provence": 478, "Goose": 434, "Pudding rice": 785, "Rump": 858, "Mixed berries": 623, "Green beans": 449, "Pepper": 721, "Salad cream": 866, "Butter": 129, "Breadcrumbs": 106, "Pepperoni": 723, "Ham": 469, "Beef ribs": 59, "Parsnip": 697, "Forced rhubarb": 391, "Capers": 145, "Iceberg lettuce": 494, "P\u{00c3}\u{00a2}t\u{00c3}\u{00a9}": 706, "Mango pickle": 588, "Apple sauce": 23, "Mozzarella": 634, "Celery": 165, "Bilberries": 70, "Rice wine": 833, "Turbot": 1027, "Sherry": 905, "Guacamole": 459, "Tilapia": 1011, "Chicken thigh": 193, "Preserves": 781, "Fusilli": 409, "Wasabi": 1056, "Flatfish": 379, "Sloe gin": 917, "Mango juice": 587, "Lemon juice": 548, "T-bone steak": 987, "Squid": 952, "Lardons": 538, "Angelica": 17, "Soy sauce": 934, "Tongue": 1019, "Carob": 150, "Pollock": 752, "Trout": 1024, "Spring greens": 948, "English muffin": 352, "Buckwheat": 124, "Marjoram": 592, "Tarragon": 1000, "Quatre-\u{00c3}\u{00a9}pices": 797, "Cassava": 155, "Jaggery": 498, "Waffles": 1053, "Wraps": 1091, "Bread sauce": 105, "Fondant icing": 387, "Pancetta": 687, "Kabana": 510, "Manchego": 582, "Gherkin": 419, "Split peas": 946, "Strong white flour": 965, "Oil": 668, "Ricotta": 834, "Breadsticks": 108, "Oyster": 680, "Oatmeal": 664, "Pumpkin": 790, "Taleggio": 992, "Leek": 542, "Caraway seeds": 148, "Galangal": 410, "Whisky cocktail": 1067, "Dried chilli": 333, "Potato r\u{00c3}\u{00b6}sti": 773, "Parfait": 694, "Sherry vinegar": 906, "Advocaat": 4, "Mixed fish": 625, "Langoustine": 536, "Pork spare rib": 769, "Pumpkin seed": 791, "Champagne": 168, "Chocolate mousse": 214, "Curd": 299, "Cocoa butter": 236, "Mint sauce": 619, "Flour": 381, "Pork leg": 764, "Ale": 6, "Cabbage": 135, "Mixed dried beans": 624, "Double cream": 327, "Duck fat": 339, "Quail's egg": 795, "Egg": 345, "Elderflower": 350, "Brown rice": 119, "Tamarind": 995, "Danish blue": 315, "Puff pastry": 786, "Soya milk": 937, "Poultry": 775, "Penne": 720, "Orange": 674, "Chilli oil": 200, "Gnocchi": 430, "Cavolo nero": 162, "Brussels sprouts": 123, "Quince": 798, "Herbs": 479, "Oily fish": 669, "Lasagne sheets": 540, "Root beer": 848, "Pitta bread": 744, "Spelt flour": 943, "Pink Fir Apple": 739, "Courgette": 268, "Mandarin": 583, "Charcuterie": 173, "Lentils": 552, "Christmas cake": 219, "Tempura": 1004, "Nut": 661, "Currants": 303, "Sole": 928, "Sweet sherry": 980, "Risotto rice": 837, "Chicken": 187, "Tortellini": 1022, "Egg white": 347, "Curry paste": 306, "Maize": 580, "Garlic bread": 416, "Crostini": 290, "English mustard": 353, "Cherry tomatoes": 182, "Cola": 250, "Kohlrabi": 520, "Melon seeds": 607, "Globe artichoke": 428, "Avocado": 34, "Chips": 208, "Fig": 366, "White chocolate": 1071, "Bok choi": 90, "Poppy seeds": 758, "Shallot": 902, "Dover sole": 329, "Celery seeds": 166, "Waxy potato": 1060, "Sorbet": 929, "Jersey Royal potatoes": 504, "Marzipan": 598, "Beetroot": 65, "Crystallised ginger": 294, "Sea trout": 891, "Passion fruit juice": 701, "Tequila": 1005, "Calvados": 139, "Lamb neck": 530, "Scrag": 887, "Irish stout": 497, "Garam masala": 413, "Suet": 968, "Lime juice": 556, "Choux pastry": 218, "Cider": 225, "Christmas pudding": 220, "Peppercorn": 722, "Gravy browning": 447, "Roast pork": 841, "Pear": 713, "Salad leaves": 867, "Milk chocolate": 611, "Pectin": 718, "Lamb breast": 524, "Soup": 931, "Caerphilly": 136, "Barbary duck": 45, "Kirsch": 518, "Cream soda": 282, "Fragrant rice": 393, "Curly kale": 301, "Saucisson": 881, "Swordfish": 985, "Wood pigeon": 1089, "Yellow lentil": 1094, "Ginger biscuit": 425, "Tomato juice": 1017, "Mince": 615, "Coffee granules": 247, "Cava": 160, "Watercress": 1058, "Turnip": 1033, "Grey mullet": 454, "Champ": 167, "Cranberry sauce": 276, "Dark chocolate": 316, "Sashimi": 878, "Webbs lettuce": 1061, "Coriander cress": 259, "Brazil nut": 102, "Harissa": 472, "Mustard oil": 645, "Coconut milk": 240, "Chanterelle mushrooms": 169, "Marrowfat peas": 595, "Chuck and blade": 221, "Puy lentils": 793, "Hominy": 485, "Clarified butter": 229, "Lime pickle": 558, "Chickpea": 195, "Curry powder": 307, "Seaweed": 894, "Peanut butter": 710, "Demerara sugar": 318, "Millet": 613, "Seafood": 892, "Wild garlic": 1084, "Mango": 585, "Pork fillet": 763, "Jujube": 507, "Cashew": 154, "Hazelnut": 473, "Cream of tartar": 281, "Turkey": 1028, "Vegetables": 1043, "Brown bread": 117, "Pink peppercorn": 740, "Betel leaves": 67, "Goose fat": 435, "Ground ginger": 456, "Mulberries": 637, "Roquefort": 850, "Starfruit": 954, "Clotted cream": 231, "Peas": 715, "Green lentil": 451, "Roast beef": 838, "Orange liqueur": 676, "Goats' milk": 432, "Prosciutto": 782, "John Dory": 506, "Fleur de sel": 380, "Satsuma": 879, "Elderberries": 349, "Stock": 960, "Saffron": 863, "Baking powder": 40, "Lard": 537, "Port": 770, "Loaf cake": 566, "Fish sauce": 371, "Little Gem lettuce": 564, "Gelatine": 417, "Mustard": 642, "Sunflower oil": 975, "Artichoke": 30, "Thyme": 1010, "Rye flour": 861, "Chinese cabbage": 204, "Lemon balm": 546, "Pulled pork": 787, "Chocolate cake": 213, "Chilli sauce": 203, "Grapefruit juice": 442, "Strawberry jam": 963, "Crackers": 273, "Marmalade": 593, "Mango chutney": 586, "Creamed coconut": 283, "Fresh coriander": 400, "Eel": 344, "Almond milk": 12, "Macadamia": 572, "Garlic and herb cream cheese": 415, "Black beans": 75, "Duxelles": 342, "Ratatouille": 813, "Mashed potato": 600, "Zander": 1096, "Cloves": 232, "Megrim": 605, "Kipper": 517, "Mulled wine": 638, "Digestive biscuit": 322, "Shin": 908, "Pineapple": 737, "Mussels": 641, "Swede": 978, "Grape juice": 440, "Monkfish": 631, "Paneer": 689, "Beef tomato": 63, "Red wine vinegar": 822, "Risotto": 836, "Kidney": 514, "Buckwheat flour": 125, "Pineapple juice": 738, "Taco": 989, "Tea": 1003, "Sage": 864, "Nettle": 654, "Pulse": 788, "Ouzo": 678, "Lemongrass": 551, "Calasparra rice": 138, "Guinea fowl": 461, "Gingerbread": 426, "Sparkling wine": 941, "Collar": 253, "Allspice": 8, "Rocket": 847, "Mixed spice": 627, "Ground almonds": 455, "Golden syrup": 433, "Honey": 486, "Mayonnaise": 602, "Cr\u{00c3}\u{00a8}me fra\u{00c3}\u{00ae}che": 284, "White fish": 1072, "Mustard leaves": 644, "Haricot beans": 471, "Nori": 659, "Chipotle": 207, "Lime": 554, "Vodka cocktail": 1052, "Nougat": 660, "Smoked trout": 923, "Piri-piri": 742, "Jam": 499, "Cherry brandy": 181, "Pickle": 729, "Wheatgerm": 1063, "Amaretti": 14, "Chicken stock": 192, "Bramley apple": 96, "Comp\u{00c3}\u{00b4}te": 254, "Turkey mince": 1030, "Chicken leg": 189, "Caster sugar": 156, "Sloe": 916, "Brown sauce": 120, "Rock salt": 846, "Sirloin": 914, "French beans": 397, "Teriyaki": 1006, "Linguine": 561, "Burger": 128, "Chocolate biscuit": 211, "Whipping cream": 1065, "Camembert": 140, "Salt cod": 874, "Spring onion": 949, "Whole wheat pasta": 1079, "Frangipane": 394, "Madeira": 577, "Biscuits": 73, "Yoghurt": 1095, "Chutney": 223, "Field mushroom": 365, "Hazelnut oil": 474, "Plaice": 746, "Beef sausage": 61, "Soured cream": 933, "Red mullet": 817, "Pasta": 702, "Praline": 777, "French bread": 398, "Rice": 828, "Soba noodles": 925, "Melon": 606, "Cockles": 234, "Savoy cabbage": 884, "Pappardelle": 692, "Gruy\u{00c3}\u{00a8}re": 458, "Runner beans": 859, "Glac\u{00c3}\u{00a9} cherries": 427, "Black sesame seeds": 80, "Octopus": 666, "Strega liqueur": 964, "Fat": 359, "Water chestnut": 1057, "Black treacle": 81, "Beef mince": 58, "Milkshake": 612, "Grouse": 457, "Bird's-eye chillies": 71, "Nashi": 651, "Papaya": 691, "Custard": 308, "Cumin": 297, "Chestnut": 185, "Apple chutney": 21, "Beef consomm\u{00c3}\u{00a9}": 56, "Food colouring": 390, "Leftover turkey": 543, "Sauces": 880, "Carrageen_moss": 152, "Noodle soup": 657, "Liqueur": 562, "Mustard cress": 643, "Almond extract": 11, "Portobello mushrooms": 771, "Cream liqueur": 280, "Greengages": 453, "Bay leaf": 51, "Teriyaki sauce": 1007, "Tayberry": 1002, "Chilli powder": 202, "Caviar": 161, "Cos lettuce": 265, "Broth": 116, "Broccoli": 115, "Cobnut": 233, "Jelly": 502, "Passata": 699, "Smoked haddock": 920, "Partridge": 698, "Straw mushroom": 961, "Sumac": 972, "Foie gras": 386, "Duck confit": 338, "Oregano": 677, "Soya oil": 938, "Vanilla pod": 1038, "Beans": 52, "Sugar": 969, "White wine": 1074, "Tamari": 993, "Semolina": 897, "Mustard powder": 646, "Malted grain bread": 581, "Corn oil": 261, "Charlotte potato": 175, "Apricot jam": 25, "Salt beef": 873, "Desiccated coconut": 320, "Mangosteen": 589, "Vanilla extract": 1037, "Fresh tuna": 401]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchIngsButton.layer.cornerRadius = 5
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        
        tableView.delegate = self
        
        
        print(UserDefaults.standard.object(forKey: "ingredients") as! [Int])
        getListOfStoredIngredients()
        tableView.reloadData()
        
        //print(arrayOfIngredients)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("inside new view!")
        print(UserDefaults.standard.object(forKey: "ingredients") as! [Int])
        super.viewDidAppear(false)
        getListOfStoredIngredients()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getListOfStoredIngredients()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        getListOfStoredIngredients()
        //print("inside cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.layoutMargins = UIEdgeInsets.zero

        
        let index = indexPath.row as Int
        
        var arrayOfIngredientsAsString:[String] = []
        for element in arrayOfIngredients{
            var newElement = ""
            newElement = String(element)
            arrayOfIngredientsAsString.append(newElement)
        }
        
        //for element in arrayOfIngredients{
        //    for(key, metaData) in dictOfIngredients{
        //        if element == metaData{
        //            print(key)
        //        }
        //    }
        //}
        //cell.textLabel!.text = arrayOfIngredientsAsString[index]
        cell.textLabel!.text = arrayOfStringIngredients[index]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfIngredients.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteIngredientIndexPath = indexPath as NSIndexPath
            let ingredientToDelete = arrayOfIngredients[indexPath.row]
            tableView.beginUpdates()
            arrayOfIngredients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.set(arrayOfIngredients, forKey: "ingredients")
            deleteIngredientIndexPath = nil
            getListOfStoredIngredients()
            tableView.endUpdates()
            tableView.reloadData()
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getListOfStoredIngredients() {
        var storedIngredients = UserDefaults.standard.object(forKey: "ingredients") as! [Int]
        arrayOfIngredients = storedIngredients
        
        for element in arrayOfIngredients{
            for(key, metaData) in dictOfIngredients{
                if element == metaData{
                    if arrayOfStringIngredients.contains(key){
                        //print("contains!")
                    }
                    else{
                    //print(key)
                    arrayOfStringIngredients.append(key)
                    }
                }
            }
        }

        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

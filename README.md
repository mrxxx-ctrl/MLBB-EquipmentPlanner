# MLBB-EquipmentPlanner
Thank you for checking-out my Mobile Legends Attribute Database.

How this works:
When calculating basic attributes we use the formula:

    Hero Base Attributes + Emblem Modifiers + Equipment/Item Modifiers

- Hero Base Attributes and Hero Metadata Schema are defined in the root/hero-meta.json
- Emblem and Item Modifiers follow the basic schema defined in root/modifiers-schema.json
- Emblem Metadata Schema is defined in root/emblem-meta.json
- Item Metadata Schema is defined in root/item-meta.json

Each of these follows the structure:
  {
     "title":"name of schema",
     "revdate":"MM-DD-YYYY",
     "data":[
        {
        ...this section repeatable per hero/item/emblem...
        }
      ]
    }

To contribute, please make sure that you use a JSON Validator before submitting.
I recommend:
https://jsonformatter.curiousconcept.com/

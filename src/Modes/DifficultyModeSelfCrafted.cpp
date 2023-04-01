#include "DifficultyModeSelfCrafted.h"
#include "HardModeHandler.h"

#include "Config.h"
#include "Player.h"
#include "Item.h"

DifficultyModeSelfCrafted::DifficultyModeSelfCrafted() : DifficultyMode(/*canBeTraded*/ false, /*canSendOrReceiveMail*/ false) { }

bool DifficultyModeSelfCrafted::CanSendAuctionHello(WorldSession const* /*session*/, ObjectGuid /*guid*/, Creature* /*creature*/)
{
    return false;
}

bool DifficultyModeSelfCrafted::CanGuildSendBankList(Guild const* /*guild*/, WorldSession* /*session*/, uint8 /*tabId*/, bool /*sendAllSlots*/)
{
    return false;
}

bool DifficultyModeSelfCrafted::CanCastItemUseSpell(Player* player, Item* item, SpellCastTargets const& /*targets*/, uint8 /*castCount*/, uint32 /*glyphIndex*/)
{
    if (IsItemExcluded(item->GetTemplate()->ItemId))
    {
        return true;
    }

    auto itemProto = item->GetTemplate();

    if (itemProto->Class != ITEM_CLASS_CONSUMABLE)
    {
        return true;
    }

    if (itemProto->SubClass != ITEM_SUBCLASS_FOOD &&
        itemProto->SubClass != ITEM_SUBCLASS_POTION &&
        itemProto->SubClass != ITEM_SUBCLASS_ELIXIR &&
        itemProto->SubClass != ITEM_SUBCLASS_FLASK)
    {
        return true;
    }

    if (item->GetGuidValue(ITEM_FIELD_CREATOR) == player->GetGUID())
    {
        return true;
    }

    return false;
}

void DifficultyModeSelfCrafted::OnCreateItem(Player* player, Item* item, uint32 /*count*/)
{
    auto itemProto = item->GetTemplate();

    if (itemProto->Class != ITEM_CLASS_CONSUMABLE)
    {
        return;
    }

    if (itemProto->SubClass != ITEM_SUBCLASS_FOOD &&
        itemProto->SubClass != ITEM_SUBCLASS_POTION &&
        itemProto->SubClass != ITEM_SUBCLASS_ELIXIR &&
        itemProto->SubClass != ITEM_SUBCLASS_FLASK)
    {
        return;
    }

    item->SetGuidValue(ITEM_FIELD_CREATOR, player->GetGUID());
}

bool DifficultyModeSelfCrafted::CanEquipItem(Player* player, uint8 /*slot*/, uint16& /*dest*/, Item* pItem, bool /*swap*/, bool /*notLoading*/)
{
    // Allow fishing poles to be equipped since you cannot craft them.
    if (pItem->GetTemplate()->Class == ITEM_CLASS_WEAPON &&
        pItem->GetTemplate()->SubClass == ITEM_SUBCLASS_WEAPON_FISHING_POLE)
    {
        return true;
    }

    if (IsItemExcluded(pItem->GetTemplate()->ItemId))
    {
        return true;
    }

    if (!pItem->GetTemplate()->HasSignature())
    {
        return false;
    }

    if (pItem->GetGuidValue(ITEM_FIELD_CREATOR) != player->GetGUID())
    {
        return false;
    }

    return true;
}

bool DifficultyModeSelfCrafted::IsItemExcluded(uint32 itemId)
{
    for (uint32 i = 0; i < excludedItemIds.size(); ++i)
    {
        if (excludedItemIds[i] == itemId)
        {
            return true;
        }
    }

    return false;
}

void DifficultyModeSelfCrafted::OnAfterConfigLoad(bool reload)
{
    if (reload)
    {
        excludedItemIds.clear();
    }

    QueryResult qResult = WorldDatabase.Query("SELECT `item_id` FROM `hardmode_selfcraft_exclude`");

    if (qResult)
    {
        uint32 count = 0;

        do
        {
            Field* fields = qResult->Fetch();
            uint32 itemId = fields[0].Get<uint32>();

            excludedItemIds.push_back(itemId);
            count++;
        } while (qResult->NextRow());

        LOG_INFO("module", "Loaded '{}' rows from 'hardmode_selfcraft_exclude' table.", count);
    }
    else
    {
        LOG_INFO("module", "Loaded '0' rows from 'hardmode_selfcraft_exclude' table.");
    }
}

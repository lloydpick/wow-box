class CreateTalentSpecs < ActiveRecord::Migration
  def self.up
    create_table :talent_specs do |t|
      t.integer :role_id
      t.string :name
      t.string :permalink
      t.timestamps
    end

    TalentSpec.create :role_id => Role.find_by_permalink("death-knight").id, :name => "Blood", :permalink => "blood"
    TalentSpec.create :role_id => Role.find_by_permalink("death-knight").id, :name => "Frost", :permalink => "frost"
    TalentSpec.create :role_id => Role.find_by_permalink("death-knight").id, :name => "Unholy", :permalink => "unholy"

    TalentSpec.create :role_id => Role.find_by_permalink("druid").id, :name => "Balance", :permalink => "balance"
    TalentSpec.create :role_id => Role.find_by_permalink("druid").id, :name => "Feral Combat", :permalink => "feral"
    TalentSpec.create :role_id => Role.find_by_permalink("druid").id, :name => "Restoration", :permalink => "restoration"

    TalentSpec.create :role_id => Role.find_by_permalink("hunter").id, :name => "Beast Mastery", :permalink => "beast-mastery"
    TalentSpec.create :role_id => Role.find_by_permalink("hunter").id, :name => "Marksmanship", :permalink => "marksmanship"
    TalentSpec.create :role_id => Role.find_by_permalink("hunter").id, :name => "Survival", :permalink => "survival"

    TalentSpec.create :role_id => Role.find_by_permalink("mage").id, :name => "Arcane", :permalink => "arcane"
    TalentSpec.create :role_id => Role.find_by_permalink("mage").id, :name => "Fire", :permalink => "fire"
    TalentSpec.create :role_id => Role.find_by_permalink("mage").id, :name => "Frost", :permalink => "frost"

    TalentSpec.create :role_id => Role.find_by_permalink("paladin").id, :name => "Holy", :permalink => "holy"
    TalentSpec.create :role_id => Role.find_by_permalink("paladin").id, :name => "Protection", :permalink => "protection"
    TalentSpec.create :role_id => Role.find_by_permalink("paladin").id, :name => "Retribution", :permalink => "retribution"

    TalentSpec.create :role_id => Role.find_by_permalink("priest").id, :name => "Discipline", :permalink => "discipline"
    TalentSpec.create :role_id => Role.find_by_permalink("priest").id, :name => "Holy", :permalink => "holy"
    TalentSpec.create :role_id => Role.find_by_permalink("priest").id, :name => "Shadow", :permalink => "shadow"

    TalentSpec.create :role_id => Role.find_by_permalink("rogue").id, :name => "Assassination", :permalink => "assassination"
    TalentSpec.create :role_id => Role.find_by_permalink("rogue").id, :name => "Combat", :permalink => "combat"
    TalentSpec.create :role_id => Role.find_by_permalink("rogue").id, :name => "Subtlety", :permalink => "subtlety"

    TalentSpec.create :role_id => Role.find_by_permalink("shaman").id, :name => "Elemental", :permalink => "elemental"
    TalentSpec.create :role_id => Role.find_by_permalink("shaman").id, :name => "Enhancement", :permalink => "enhancement"
    TalentSpec.create :role_id => Role.find_by_permalink("shaman").id, :name => "Restoration", :permalink => "restoration"

    TalentSpec.create :role_id => Role.find_by_permalink("warlock").id, :name => "Affliction", :permalink => "affliction"
    TalentSpec.create :role_id => Role.find_by_permalink("warlock").id, :name => "Demonology", :permalink => "demonology"
    TalentSpec.create :role_id => Role.find_by_permalink("warlock").id, :name => "Destruction", :permalink => "destruction"

    TalentSpec.create :role_id => Role.find_by_permalink("warrior").id, :name => "Arms", :permalink => "arms"
    TalentSpec.create :role_id => Role.find_by_permalink("warrior").id, :name => "Fury", :permalink => "fury"
    TalentSpec.create :role_id => Role.find_by_permalink("warrior").id, :name => "Protection", :permalink => "protection"

  end

  def self.down
    drop_table :talent_specs
  end
end

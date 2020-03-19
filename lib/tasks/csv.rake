require 'csv'

namespace :csv do
  desc 'Load CSV files in vendor/ directory.'

  task reload: :environment do
    Passage.destroy_all
    Reference.destroy_all
    Edition.destroy_all
    Text.destroy_all

    editions = CSV.read(Rails.root.join('vendor', 'editions.csv'))
    passages = CSV.read(Rails.root.join('vendor', 'passages.csv'))

    text = Text.create!(urn: 'urn:cts:greekLit:tlg0557.tlg002.perseus-grc2')

    edition_hash = {}
    editions.each do |edition|
      name, description = *edition

      edition_hash[name] = Edition.create!(text: text, name: name, description: description)
    end

    reference_hash = {}
    rank = 0
    passages.each do |passage|
      ref = passage[0]

      unless reference_hash[ref]
        reference_hash[ref] = Reference.create!(text: text, rank: rank, ref: ref)
        rank += 1
      end
    end

    passages.each do |passage|
      ref, edition_title, text = *passage

      Passage.create!(reference: reference_hash[ref], edition: edition_hash[edition_title], passage: text)
    end
  end
end

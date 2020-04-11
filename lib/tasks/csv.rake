require 'csv'

namespace :csv do
  desc 'Load CSV files in vendor/ directory.'

  task reload: :environment do
    editions = CSV.read(Rails.root.join('vendor', 'csv', 'editions.csv'))
    passages = CSV.read(Rails.root.join('vendor', 'csv', 'passages.csv'))

    text = Text.find_or_create_by!(urn: 'urn:cts:greekLit:tlg0557.tlg002.perseus-grc2')

    edition_hash = {}
    editions.each do |edition|
      name, description = *edition

      edition_hash[name] = Edition.find_or_create_by!(text: text, name: name)
      edition_hash[name].update(description: description)
    end

    reference_hash = {}
    rank = 0
    passages.each do |passage|
      ref = passage[0]

      next if reference_hash[ref]

      reference_hash[ref] = Reference.find_or_create_by!(rank: rank, ref: ref, text: text)
      rank += 1
    end

    passages.each do |passage|
      ref, edition_title, text = *passage

      passage = Passage.find_or_create_by!(reference: reference_hash[ref], edition: edition_hash[edition_title])
      passage.update(passage: text)
    end
  end
end

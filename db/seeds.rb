card = Card.create!(id: 1, content: '西小倉宏信のホームページ')


card1 = Card.create!(content: '245cloudについて', parent_id: card.id)


card1 = Card.create!(content: 'Ingressについて', parent_id: card.id)
card1 = Card.create!(content: 'MUFGカプセルの運用', parent_id: card1.id)



card1 = Card.create!(content: 'ラフノート株式会社について', parent_id: card.id)


card1 = Card.create!(content: 'マカロニデイズについて', parent_id: card.id)



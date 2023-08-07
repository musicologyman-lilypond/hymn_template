\version "2.24.0"

\header {
  title = ""
  tagline = ""
}

\paper {
 indent = 0 \in
}

global = {
  \time 3/4
  \key f \major
  %\tempo 4=100
}

lineBreaks = {
   s2. * 4 \break
   s2. * 5 \break
   s2. * 6 \break
}

soprano = \relative c' {
  \global
  \repeat unfold 2 {
   f4 f c' |
   a4. g8 f4 |
   e d c |
   d e f |
   g2. |
   f2. |
  }
  c'4 c c |
  d2. |
  a4 bes c |
  c bes a |
  g2. |
  c,4 d e |
  f g a |
  g2. |
  f2. \bar "|."

}

alto = \relative c' {
  \global
  \repeat unfold 2 {
   c4 d c |
   c4. e8 d4 |
   c bes a |
   bes bes a |
   d (c bes) |
   a2. |
  }
  f'4 g f |
  f2. |
  f4 f g |
  f d8 e f4 |
  e2. |
  c4 bes bes |
  a d cis |
  d2 (c!4) |
  a2. \bar "|."

}

tenor = \relative c' {
  \global
  \repeat unfold 2 {
   a4 a g |
   c4. bes8 a4
   a f f
   f g f f (e2) |
   f2.
  }
  a4 g a
  bes2.
  c4 bes g
  a bes c
  c2. |
  f,4 f g
  f d e
  d (g8 f e4) |
  f2. \bar "|."
}

bass = \relative c {
  \global
  \repeat unfold 2 {
    f4 d e
    f4. c8 d4
    a bes f
    bes g d'
    bes (c2)
    f,2. |
  }
  f'4 e f
  bes,2.
  f'4 d e
  f g a8 f
  c2. |
  a4 bes g
  d' bes a |
  bes2 (c4)
  f,2. \bar "|."

}

verseOne = \lyricmode {
  \set stanza = "1."
  Praise to the Lord, the Al -- might -- y, the King of cre -- a -- tion;
  O my soul, praise him, for he is thy health and sal -- va -- tion:
  join the great throng, psal -- ter -- y, or -- gan, and song,
  sound -- ing in glad ad -- or -- a -- tion.


}

verseTwo = \lyricmode {
  \set stanza = "2."
  Praise to the Lord; o -- ver all things he glo -- rious -- ly reign -- eth:
  borne as on ea -- gle -- wings, safe -- ly his saints he sus -- tain -- eth.
  Hast thou nt seen how all thou need -- est hath been
  grant -- ed in what he or -- dain -- eth?

}

verseThree = \lyricmode {
  \set stanza = "3."
  Praise to the Lord, who doth pros -- per thy way and de -- fend thee;
  sure -- ly his good -- ness and mer -- cy shall ev -- er at -- tend thee;
  pon -- der a -- new what the Al -- might -- y can do,
  who with his love doth be -- friend thee.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Praise to the Lord, O let all that is in me a -- dore him!
  All that hath life and breath come now with prais -- es be -- fore him!
  Let the a -- men sound from his peo -- ple again;
  glad -- ly for ev -- er a -- dore him.
}

\score {
  \new ChoirStaff
    \with {
     \remove System_start_delimiter_engraver
    }
    <<
    \new Staff \with {
      midiInstrument = "choir aahs"
     \remove Time_signature_engraver
    } <<
      %\new Voice = "lineBreaks" \lineBreaks
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseThree
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseFour

    \new Staff \with {
      midiInstrument = "choir aahs"
      \remove Time_signature_engraver
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout {
    \context {
      \Score
      \remove "Bar_number_engraver"
      }
    }

  \midi { }
}

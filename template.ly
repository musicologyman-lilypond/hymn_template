\version "$LILYPOND_VERSION"

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
  % soprano voice here
  \bar "|."

}

alto = \relative c' {
  \global
  % alto voice here
  \bar "|."

}

tenor = \relative c' {
  \global
  % tenor voice here
  \bar "|."
}

bass = \relative c {
  \global
  % bass voice here
  \bar "|."

}

verseOne = \lyricmode {
  \set stanza = "1."
  % verse I text here
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % verse II text here
}

verseThree = \lyricmode {
  \set stanza = "3."
  % verse III text here
}

verseFour = \lyricmode {
  \set stanza = "4."
  % verse IV text here
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

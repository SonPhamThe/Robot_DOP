*** Settings ***
Documentation       Google translate song lyrics from source to target language.
...                 Saves the original and the translated lyrics as text files.

Library             RPA.Browser.Selenium
Library             DateTime
Library             OperatingSystem
Library             RPA.Netsuite
Library             DOP.RPA.Asset
Resource            ./resources/login_web.robot

Suite Setup         Open My Browser    ${LYRICS_URL}
Suite Teardown      Close Browsers
Task Teardown       Close All Browsers

*** Variables ***
${LYRICS_URL}       https://www.lyrics.com/

*** Tasks ***
Google Translate Song Lyrics From Source To Target Language
    [Documentation]    This task performs getting lyrics, translating lyrics, and saving lyrics, with the detailed steps as follows:
    ...    Gets the lyrics of a song from a lyrics website.
    ...    Validates the length of the lyrics.
    ...    Translates the lyrics from the source language to the target language using google translate.
    ...    Saves the original and translated lyrics as text files.

    Login Website Lyric Music

    # ${lyric}=    Get Lyrics
    # Handle Get Lyrics Error    ${lyric}
    # ${translation}=    Translate Lyrics    ${lyric}
    # Save Lyrics    ${lyric}    ${translation}
    # Task Teardown


*** Keywords ***
Login Website Lyric Music
    Click Element    xpath://*[@id="user-login"]/a
    ${lyric_demo_credentials}=    Get Asset    lyric_demo_account
    ${lyric_demo_credentials}=    Set Variable    ${lyric_demo_credentials}[value]
    Wait Until Keyword Succeeds
    ...    3x
    ...    1s
    ...    Login Browser
    ...    ${lyric_demo_credentials}[username_lyric_demo]
    ...    ${lyric_demo_credentials}[password_lyric_demo]
    ...    content-body

Get Lyrics
    [Documentation]    Get the song lyrics from the lyrics website.
    Wait Until Element Is Visible    css:.best-matches a
    Click Element    css:.best-matches a
    ${lyric_element}=    Set Variable    id:lyric-body-text
    Wait Until Element Is Visible    ${lyric_element}
    ${lyric}=    Get Text    ${lyric_element}
    Log    ${lyric}
    RETURN    ${lyric}
